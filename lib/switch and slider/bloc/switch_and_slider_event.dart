import 'package:equatable/equatable.dart';

abstract class OpacityEvent extends Equatable {
  const OpacityEvent();

  @override
  List<Object> get props => [];
}

class ChangeOpacity extends OpacityEvent {
  final double opacity;

  const ChangeOpacity(this.opacity);

  @override
  List<Object> get props => [opacity];
}

class NotificationEvent extends OpacityEvent {
  final bool status;

  const NotificationEvent(this.status);

  @override
  List<Object> get props => [status];
}