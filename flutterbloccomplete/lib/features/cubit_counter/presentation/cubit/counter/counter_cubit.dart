import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState(counterValue: 1));
  void increment() =>
      emit(CounterIncrementedState(counterValue: state.counterValue + 1));
  void decrement() =>
      emit(CounterDecrementedState(counterValue: state.counterValue - 1));
      
  @override
  Future<void> close() {
    print('Counter Closed');
    return super.close();
  }
}
