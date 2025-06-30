class CounterState {
  final int seats;

  CounterState(this.seats);

  bool get enabledSubmit => seats > 0;
}
