part of 'request_form_bloc.dart';

@immutable
abstract class RequestFormEvent {}

class RequestFormEventSearch implements RequestFormEvent {
  final String url;

  RequestFormEventSearch({required this.url});
}

class RequestFormEventUrlChanged implements RequestFormEvent {
  final String url;

  RequestFormEventUrlChanged({required this.url});
}
