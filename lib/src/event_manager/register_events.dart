// Project imports:
import 'events.dart';

class EventRegistrationExpiring extends EventType {
  EventRegistrationExpiring();
}

class EventRegistered extends EventType {
  EventRegistered({this.cause, this.contact});
  ErrorCause? cause;
  String? contact;
}

class EventRegistrationFailed extends EventType {
  EventRegistrationFailed({this.cause});
  ErrorCause? cause;
}

class EventUnregister extends EventType {
  EventUnregister({this.cause});
  ErrorCause? cause;
}
