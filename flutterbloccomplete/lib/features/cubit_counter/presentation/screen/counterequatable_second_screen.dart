import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloccomplete/core/constants/enums.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counter/counter_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counterequatable/counterequatable_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_internet/presentation/cubit/internet_cubit.dart';

class CubitCounterEquatableSecondScreen extends StatelessWidget {
  final String title;
  final Color colorAppbar;

  const CubitCounterEquatableSecondScreen(
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
                builder: (internetCubitContext, state) {
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
            BlocConsumer<CounterEquatableCubit, CounterEquatableState>(
              listener: (context, state) {
                if (state is CounterEquatableIncrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state is CounterEquatableDecrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'EVEN ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'NUMBER 5',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Builder(builder: (builderContext) {
              final counterState = builderContext.watch<CounterCubit>().state;
              final internetState = builderContext.watch<InternetCubit>().state;
              if (internetState is InternetConnectedState &&
                  internetState.connectionType == ConnectionType.mobile) {
                return Text(
                    'Counter: ${counterState.counterValue} Internet: Mobile');
              } else if (internetState is InternetConnectedState &&
                  internetState.connectionType == ConnectionType.wifi) {
                return Text(
                    'Counter: ${counterState.counterValue} Internet: Wi-Fi');
              } else if (internetState is InternetConnectedState &&
                  internetState.connectionType == ConnectionType.other) {
                return Text(
                    'Counter: ${counterState.counterValue} Internet: Other');
              } else {
                return Text(
                    'Counter: ${counterState.counterValue} Internet: Disconnected');
              }
            }),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterEquatableCubit>(context,
                            listen: false)
                        .decrement();
                  },
                  tooltip: 'Decrement',
                  heroTag: "$title decrement",
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterEquatableCubit>(context).increment();
                    context.read<CounterEquatableCubit>().increment();
                  },
                  tooltip: 'Increment',
                  heroTag: "$title increment",
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
