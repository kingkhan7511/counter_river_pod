abstract class ICounterRepository {
  Future<int> incrementCounter();
  Future<int> decrementCounter();
}

class CounterRepository extends ICounterRepository {
  int _counter = 0;
  CounterRepository();
  @override
  Future<int> decrementCounter() {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        _counter = _counter - 1;

        return _counter;
      },
    );
  }

  @override
  Future<int> incrementCounter() {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        _counter = _counter + 1;

        return _counter;
      },
    );
  }
}
