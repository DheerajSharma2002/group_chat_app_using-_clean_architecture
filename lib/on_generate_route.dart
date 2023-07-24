import 'package:chat_clean_arch/constant/const.dart';
import 'package:chat_clean_arch/feature/presentation/pages/create_new_group_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/forgot_password_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/login_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/register_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/single_chat_page.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
//    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.singleChatPage:
        {
          return materialBuilder(widget: const SingleChatPage());
        }

      case PageConst.createNewGroupPage:
        {
          return materialBuilder(widget: const CreateNewGroupPage());
        }
      case PageConst.forgotPasswordPage:
        {
          return materialBuilder(widget: const ForgotPasswordPage());
        }
      case PageConst.loginPage:
        {
          return materialBuilder(widget: const LoginPage());
        }
      case PageConst.registerPage:
        {
          return materialBuilder(widget: const RegisterPage());
        }
      case "/":
        {
          return materialBuilder(widget: const LoginPage());
        }

      default:
        return materialBuilder(widget: ErrorPage());
    }
  }
}

// ignore: use_key_in_widget_constructors
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error page"),
      ),
      body: const Center(
        child: Text("Eroor page"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
