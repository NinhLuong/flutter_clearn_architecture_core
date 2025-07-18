// ThinhNguyen
// 15:23 13/9/24

import 'package:cct_core/gen/assets.gen.dart';
import 'package:cct_core/src/presentations/widgets/dropdow_widget/drop_down.dart';
import 'package:flutter/material.dart';

class AppBarSub extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final Color color;
  final String title;
  final Color titleColor;
  final int numberDelete;
  final Icon? leadingIcon;
  final bool hasFilter;
  final double titleTextSize;
  final List<String> filterValues;
  final Function()? onMoreButtonClick;
  final Function()? callbackWhenDelete;
  final Function()? callbackWhenLeadingClick;
  final Function(int)? callbackWhenFilterChanged;

  const AppBarSub(
      {super.key,
      required this.context,
      required this.title,
      required this.color,
      this.titleColor = Colors.black,
      this.callbackWhenLeadingClick,
      this.hasFilter = false,
      this.leadingIcon,
      this.callbackWhenFilterChanged,
      this.filterValues = const [],
      this.numberDelete = 0,
      this.callbackWhenDelete,
      this.onMoreButtonClick,
      this.titleTextSize = 18});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: 0,
      centerTitle: true,
      leadingWidth: isTablet()
          ? 64
          : title.length > 20
              ? MediaQuery.of(context).size.width / 7
              : MediaQuery.of(context).size.width / 4,
      leading: InkWell(
        onTap: () async {
          if (callbackWhenLeadingClick != null) {
            await callbackWhenLeadingClick!();
          } else {
            Navigator.pop(this.context);
          }
        },
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          child: Row(
            children: <Widget>[
              leadingIcon != null
                  ? leadingIcon!
                  : Image.asset(
                      Assets.icon.appbarIcon.backIcon.path,
                      width: 20,
                      height: 20,
                      package: "cct_core",
                    ),
            ],
          ),
        ),
      ),
      actions: [
        if (hasFilter)
          DropDownChoice(
            buttonWidth: 100,
            callbackWhenChange: callbackWhenFilterChanged,
            dropdownWidth: 120,
            values: filterValues,
            showValue: false,
          ),
      ],
      title: Text(
        textScaler: const TextScaler.linear(1),
        title,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: titleTextSize,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 48);
}

bool isTablet() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide >= 600;
}
