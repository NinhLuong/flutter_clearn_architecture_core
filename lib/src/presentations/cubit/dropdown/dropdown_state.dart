part of 'dropdown_cubit.dart';

class DropDownState extends Equatable {
  final int choiceIndex;

  const DropDownState(this.choiceIndex);

  @override
  List<Object?> get props => [choiceIndex];
}
