import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dropdown_state.dart';

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(const DropDownState(0));

  Future<void> changeIndex(int index) async {
    emit(DropDownState(index));
  }
}
