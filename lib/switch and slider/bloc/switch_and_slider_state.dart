import 'package:equatable/equatable.dart';

class OpacityState extends Equatable {
  final double opacity;

  const OpacityState(this.opacity);

  @override
  List<Object> get props => [opacity];
}


class NotificationState extends Equatable {
  final bool status;

  const NotificationState(this.status);

  @override
  List<Object> get props => [status];
}