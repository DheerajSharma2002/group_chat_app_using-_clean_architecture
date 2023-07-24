import 'package:chat_clean_arch/constant/const.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/container_button_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/headerwidget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/row_text_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_password_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    dobController.dispose();
    genderController.dispose();
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
              const HeaderWidget(title: "Registeration"),
              const SizedBox(
                height: 10,
              ),
              _profileWidget(),
              const SizedBox(
                height: 10,
              ),
              TextEmailContainerWidget(
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                controller: usernameController,
                hintText: "Enter you Name",
              ),
              const SizedBox(
                height: 10,
              ),
              TextEmailContainerWidget(
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                hintText: "email",
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                indent: 120,
                endIndent: 120,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldPasswordContainerWidget(
                controller: passwordController,
                keyboardType: TextInputType.text,
                prefixIcon: Icons.lock,
                hintText: "Password",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldPasswordContainerWidget(
                controller: passwordAgainController,
                keyboardType: TextInputType.text,
                prefixIcon: Icons.lock,
                hintText: "Confirm Password",
              ),
              const SizedBox(
                height: 10,
              ),
              TextEmailContainerWidget(
                keyboardType: TextInputType.datetime,
                controller: dobController,
                hintText: "Date of birth",
              ),
              const SizedBox(
                height: 10,
              ),
              TextEmailContainerWidget(
                keyboardType: TextInputType.text,
                controller: genderController,
                hintText: "Gender",
              ),
              const SizedBox(
                height: 10,
              ),
              const ContainerButtonWidget(
                title: "Register",
              ),
              const SizedBox(
                height: 10,
              ),
              RowTextWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                title1: "Do you have already an Account?",
                title2: "Login",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.loginPage, (route) => false);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              _rowDataWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _profileWidget() {
  return Column(
    children: [
      Container(
        height: 62,
        width: 62,
        decoration:
            const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        child: Image.asset(
          "assets/profilephot.jpg",
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      const Text(
        "Add Profile Photo",
        style: TextStyle(color: Colors.green),
      ),
    ],
  );
}

Widget _rowDataWidget() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'By clicking register, you agree to the',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w700, color: colorC1C1C1),
      ),
      Text(
        'Privacy Policy',
        style: TextStyle(
          color: greenColor,
          fontSize: 12,
        ),
      ),
    ],
  );
}
