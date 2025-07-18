import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_bar_visible_state.dart';

class NotificationBarVisibleCubit extends Cubit<NotificationBarVisibleState> {
  NotificationBarVisibleCubit() : super(NotificationBarVisible());

  Future<void> setVisibleStateNotificationBar(bool isVisible) async {
    emit(isVisible ? NotificationBarVisible() : NotificationBarInvisible());
  }
}
