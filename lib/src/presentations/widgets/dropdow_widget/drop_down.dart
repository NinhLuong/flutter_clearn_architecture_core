import 'package:cct_core/src/presentations/cubit/dropdown/dropdown_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownChoice extends StatefulWidget {
  final List<String> values;
  final Function(int)? callbackWhenChange;
  final double buttonWidth;
  final double dropdownWidth;
  final bool showValue;
  final int? initValue;

  const DropDownChoice(
      {super.key,
      required this.values,
      required this.callbackWhenChange,
      required this.buttonWidth,
      required this.dropdownWidth,
      this.showValue = true,
      this.initValue});

  @override
  State<DropDownChoice> createState() => _DropDownChoiceState();
}

class _DropDownChoiceState extends State<DropDownChoice> {
  final DropDownCubit _dropDownCubit = DropDownCubit();
  String _dropDownValue = "";

  @override
  void initState() {
    super.initState();
    _dropDownValue = widget.initValue != null
        ? widget.values[widget.initValue!]
        : widget.values.first;
    _dropDownCubit.changeIndex(widget.values.indexOf(_dropDownValue));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.buttonWidth,
      height: 32,
      margin: const EdgeInsets.only(right: 16),
      child: BlocBuilder(
          bloc: _dropDownCubit,
          builder: (context, state) {
            _dropDownValue =
                widget.values[(state as DropDownState).choiceIndex];
            return DropdownButtonHideUnderline(
              child: DropdownButton2(
                dropdownStyleData: DropdownStyleData(
                    width: widget.dropdownWidth,
                    direction: DropdownDirection.left,
                    padding: EdgeInsets.zero,
                    elevation: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    )),
                isExpanded: true,
                items: widget.values
                    .map((item) => DropdownMenuItem<String>(
                        value: item,

                        child: Text(
                            textScaler: const TextScaler.linear(1),
                            textAlign: TextAlign.right,
                            item,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: _dropDownValue == item
                                        ? Colors.black
                                        : Colors.grey)
                        )))
                    .toList(),
                alignment: Alignment.centerLeft,
                selectedItemBuilder: (context) => widget.values
                    .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 4),
                          child: Text(
                              textAlign: TextAlign.right,
                              item,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: Colors.grey)
                          ),
                        )))
                    .toList(),
                value: widget.showValue ? _dropDownValue : null,
                onChanged: (value) {
                  int index = widget.values.indexOf(value.toString());
                  _dropDownCubit.changeIndex(index);
                  widget.callbackWhenChange!(index);
                },
              ),
            );
          }),
    );
  }
}
