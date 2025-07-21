import 'package:event_bus/event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/common/events/events.dart';
import 'package:my_first_app/common/events/events_handler.dart';
import 'package:my_first_app/cubit/loggedin/logged_in_state.dart';

class LoggedInCubit extends Cubit<LoggedInState> {
  LoggedInCubit() : super(LoggedInState(''));

  SubscriptionHandler _eventSubscriptionHandler = SubscriptionHandler();

  void initCubit() {
    _setUpEventBusListener();
  }

  void _setUpEventBusListener() {
    print("Log from myself : Entered set up bus listener");
    _eventSubscriptionHandler.seatsValueSubmitted = eventBus
        .on<SeatsValueSubmitted>()
        .listen((event) {
              print("Log from myself : Entered bus listener");
          final eventSender = event.sender;
          print("eventSender : $eventSender");
          emit(LoggedInState(eventSender));
        });
  }

  @override
  Future<void> close() async {
    _eventSubscriptionHandler.clearSubscriptions();
    await super.close();
  }
}
