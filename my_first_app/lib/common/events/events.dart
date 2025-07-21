import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class SeatsValueSubmitted {
  final String sender;
  SeatsValueSubmitted({required this.sender});
}