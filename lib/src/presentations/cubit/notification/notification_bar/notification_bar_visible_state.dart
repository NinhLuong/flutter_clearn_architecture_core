part of 'notification_bar_visible_cubit.dart';

abstract class NotificationBarVisibleState extends Equatable {
  const NotificationBarVisibleState();

  @override
  List<Object> get props => [UniqueKey().hashCode];
}

class NotificationBarVisible extends NotificationBarVisibleState {}

class NotificationBarInvisible extends NotificationBarVisibleState {}
