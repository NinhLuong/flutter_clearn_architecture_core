import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expandable_app_bar_state.dart';

class AppbarExpandableCubit extends Cubit<AppbarExpandableState> {
  AppbarExpandableCubit() : super(AppbarExpandableShow());

  Future<void> hideAppbarExpandable() async {
    emit(AppbarExpandableHide());
  }

  Future<void> showAppbarExpandable() async {
    emit(AppbarExpandableShow());
  }
}