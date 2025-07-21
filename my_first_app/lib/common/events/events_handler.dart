import 'dart:async';

class SubscriptionHandler {
  StreamSubscription? seatsValueSubmitted;

  void clearSubscriptions() {
    seatsValueSubmitted?.cancel();
  }
}
