class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    final result = Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1).take(ticks);
    return result;
  }
}
