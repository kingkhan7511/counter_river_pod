import 'package:counter_river_pod/infrastructure/counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CounterState {
  const CounterState();
}

class CounterInitialize extends CounterState {
  const CounterInitialize();
}

class CounterLoaded extends CounterState {
  final int counter;
  const CounterLoaded(this.counter);
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is CounterLoaded && o.counter == counter;
  }
}

class CounterNotifier extends StateNotifier<CounterState> {
  final CounterRepository _counterRepository;
  CounterNotifier(this._counterRepository) : super(CounterLoaded(0));

  Future<void> increament() async {
    state = CounterInitialize();
    final countValue = await _counterRepository.incrementCounter();
    state = CounterLoaded(countValue);
  }

  Future<void> decreament() async {
    state = CounterInitialize();
    final countValue = await _counterRepository.decrementCounter();
    state = CounterLoaded(countValue);
  }
}
