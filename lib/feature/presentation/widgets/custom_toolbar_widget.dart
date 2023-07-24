import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

typedef ToolbarIndexController = Function(int index);

class CustomToolBarWidget extends StatelessWidget {
  final ToolbarIndexController toolbarIndexController;
  final int? pageIndex;
  const CustomToolBarWidget(
      {super.key, required this.toolbarIndexController, this.pageIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: ToolBarItem(
              onTap: () {
                toolbarIndexController(0);
              },
              title: "Groups",
              borderColor: pageIndex == 0 ? Colors.white : Colors.transparent,
              textColor: pageIndex == 0 ? Colors.white : Colors.black,
            ),
          ),
          Expanded(
            child: ToolBarItem(
              onTap: () {
                toolbarIndexController(1);
              },
              title: "Users",
              borderColor: pageIndex == 1 ? Colors.white : Colors.transparent,
              textColor: pageIndex == 1 ? Colors.white : Colors.black,
            ),
          ),
          Expanded(
            child: ToolBarItem(
              onTap: () {
                toolbarIndexController(2);
              },
              title: "Profile",
              borderColor: pageIndex == 2 ? Colors.white : Colors.transparent,
              textColor: pageIndex == 2 ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ToolBarItem extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final double? borderWidth;
  final VoidCallback? onTap;
  final Color? borderColor;
  const ToolBarItem(
      {super.key,
      this.title,
      this.textColor,
      this.borderWidth = 3.0,
      this.onTap,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: borderColor!, width: borderWidth!),
          ),
        ),
        child: Text(
          title!,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
        ),
      ),
    );
  }
}
