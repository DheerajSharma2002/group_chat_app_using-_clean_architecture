import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class TextFieldPasswordContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? prefixIcon;

  final TextInputType? keyboardType;
  final String? hintText;

  const TextFieldPasswordContainerWidget(
      {super.key, this.controller, this.prefixIcon, this.keyboardType, this.hintText});

  @override
  State<TextFieldPasswordContainerWidget> createState() =>
      _TextFieldPasswordContainerWidgetState();
}

class _TextFieldPasswordContainerWidgetState
    extends State<TextFieldPasswordContainerWidget> {
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: colorC1C1C1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: isObsecureText,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isObsecureText = !isObsecureText;
                });
              },
              child: Icon(isObsecureText == true
                  ? Icons.panorama_fish_eye
                  : Icons.remove_red_eye)),
          prefixIcon: Icon(widget.prefixIcon),
        ),
      ),
    );
  }
}
