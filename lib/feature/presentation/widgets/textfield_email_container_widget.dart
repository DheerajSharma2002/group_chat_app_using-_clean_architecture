import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class TextEmailContainerWidget extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? hintText;
  final double? borderRadius;
  final Color? color;
  final VoidCallback? iconClickEvent;

  const TextEmailContainerWidget(
      {super.key,
      this.controller,
      this.prefixIcon,
      this.keyboardType,
      this.hintText,
      this.borderRadius,
      this.iconClickEvent,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color ?? colorC1C1C1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: InkWell(onTap: iconClickEvent, child: Icon(prefixIcon)),
        ),
      ),
    );
  }
}
