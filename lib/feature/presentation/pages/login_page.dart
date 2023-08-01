import 'package:chat_clean_arch/constant/const.dart';
import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/container_button_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/headerwidget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/row_text_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cubit/auth/cubit/auth_cubit.dart';
import '../cubit/credentials/cubit/credential_cubit.dart';
import '../widgets/textfield_password_container_widget.dart';
import 'home_page.dart';

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
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            Fluttertoast.showToast(msg: "Invalid Email Password");
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            return CircularProgressIndicator();
          }
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
              if (authState is AuthenticatedState) {
                return HomePage(
                  uid: authState.uid,
                );
              } else {
                return _bodyWidget();
              }
            });
          }
          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
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
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PageConst.forgotPasswordPage);
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: greenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ContainerButtonWidget(
              title: "Login",
              onTap: _submitSignIn,
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
    );
  }

  void _submitSignIn() {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your email");
    }
    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter you password");
    }

    BlocProvider.of<CredentialCubit>(context).submitSignIn(
        user: UserEntity(
            email: emailController.text, password: passwordController.text));
  }
}

// Widget _forgotPasswordWidget() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       const Text(""),
//       InkWell(
//         onTap: () {},
//         child: 
//       ),
//     ],
//   );
//}

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
