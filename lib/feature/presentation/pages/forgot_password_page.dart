import 'package:chat_clean_arch/feature/presentation/widgets/container_button_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/headerwidget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/row_text_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:flutter/material.dart';

import '../../../constant/const.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          child: Column(
            children: [
              const HeaderWidget(title: "Forgot Password"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "Don't worry! just fill in your eamil and ${AppConst.appName} will send you a link to a rest you password"),
              const SizedBox(
                height: 20,
              ),
              TextEmailContainerWidget(
                controller: _emailController,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              const ContainerButtonWidget(
                title: "Send Password Reset Email",
              ),
              const SizedBox(
                height: 10,
              ),
              RowTextWidget(
                title1: "Remember the account information?",
                title2: "Login",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.loginPage, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
