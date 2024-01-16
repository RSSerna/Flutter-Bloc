import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloccomplete/core/constants/enums.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counterwithoutstate/counterwithoutstate_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_internet/presentation/cubit/internet_cubit.dart';

class CubitCounterWithOurStateScreen extends StatelessWidget {
  final String title;
  final Color colorAppbar;

  const CubitCounterWithOurStateScreen(
      {super.key, required this.title, required this.colorAppbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppbar,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnectedState &&
                  state.connectionType == ConnectionType.mobile) {
                return const Text('Mobile');
              } else if (state is InternetConnectedState &&
                  state.connectionType == ConnectionType.wifi) {
                return const Text('Wi-fi');
              } else if (state is InternetConnectedState &&
                  state.connectionType == ConnectionType.other) {
                return const Text('Other');
              } else if (state is InternetDisconnectedState) {
                return const Text('Disconnected');
              }
              return const CircularProgressIndicator.adaptive();
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterWithOutStateCubit, int>(
              buildWhen: (previous, current) {
                if (previous < current) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                  return true;
                } else if (previous > current) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state < 0) {
                  return Text(
                    'NEGATIVE $state',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state % 2 == 0) {
                  return Text(
                    'EVEN $state',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state == 5) {
                  return Text(
                    'NUMBER 5',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    state.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterWithOutStateCubit>(context)
            //             .decrement();
            //       },
            //       tooltip: 'Decrement',
            //       heroTag: "$title decrement",
            //       child: const Icon(Icons.remove),
            //     ),
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterWithOutStateCubit>(context)
            //             .increment();
            //       },
            //       tooltip: 'Increment',
            //       heroTag: "$title increment",
            //       child: const Icon(Icons.add),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
