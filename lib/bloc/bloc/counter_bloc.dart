import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super( const CounterState(0)) {
    on<CounterEvent>((event, emit) async {
      (event is Increment) ? emit(CounterState(state.value + 1)) : emit(CounterState(state.value -1));
    });
  }
}
