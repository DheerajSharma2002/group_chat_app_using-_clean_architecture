import 'package:chat_clean_arch/constant/const.dart';
import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/credentials/cubit/credential_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/pages/home_page.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/container_button_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/headerwidget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/row_text_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_password_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            ContainerButtonWidget(
              title: "Register",
              onTap: () {
                _submitSignUp();
              },
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
    );
  }

  void _submitSignUp() {
    if (usernameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your name");
      return;
    }
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your email");
      return;
    }
    if (passwordController.text == passwordAgainController.text) {
    } else {
      Fluttertoast.showToast(msg: "Both password must be same");
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: UserEntity(
      name: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      isOnline: false,
      status: "",
      profileUrl: "",
      phoneNumber: "",
      dob: dobController.text.isEmpty ? "" : dobController.text,
      gender: genderController.text.isEmpty ? "" : genderController.text,
    ));
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
