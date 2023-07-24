import 'package:chat_clean_arch/constant/const.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/container_button_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/headerwidget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/row_text_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

import '../widgets/textfield_password_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              const HeaderWidget(title: 'Login'),
              TextEmailContainerWidget(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldPasswordContainerWidget(
                keyboardType: TextInputType.emailAddress,
                controller: passwordController,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(
                height: 8,
              ),
              _forgotPasswordWidget(),
              const SizedBox(
                height: 10,
              ),
              ContainerButtonWidget(
                title: "Login",
                tonTap: () {
                  print("Hello Login Button");
                },
              ),
              const SizedBox(
                height: 10,
              ),
              RowTextWidget(
                title1: "Don't have an Account?",
                title2: "Register",
                onTap: () {
                  Navigator.pushNamed(context, PageConst.registerPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _forgotPasswordWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(""),
      InkWell(
        onTap: () {},
        child:  Text(
          "Forgot Password?",
          style: TextStyle(
              color: greenColor, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    ],
  );
}

// Widget _rowGoogleWidget() {
//   return Row(
//     children: [
//       Container(
//         height: 50,
//         width: 50,
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Icon(Icons.google),

//       ),
//     ],
//   );
// }
