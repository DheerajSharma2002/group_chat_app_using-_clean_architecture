import 'package:flutter/material.dart';

class ContainerButtonWidget extends StatelessWidget {
  final String? title;
  final VoidCallback? tonTap;
  const ContainerButtonWidget({super.key, this.title, this.tonTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tonTap,
      child: Container(
        height: 44,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "$title",
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
