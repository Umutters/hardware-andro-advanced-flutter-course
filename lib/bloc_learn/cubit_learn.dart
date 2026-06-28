import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  void increment() => emit(state + 1);
}

Future<void> main() async {
  final cubit = CounterCubit(1);
  final subscription = cubit.stream.listen(print);
  cubit.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}
