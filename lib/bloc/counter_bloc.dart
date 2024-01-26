import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

abstract class CounterEvent {}
class Increment extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>(
          (event, emit) async {
        await Future.delayed(Duration(seconds: 1));
        emit(state + 1);
      },
      /// Specify a custom event transformer from `package:bloc_concurrency`
      transformer: sequential(),
    );
  }
}