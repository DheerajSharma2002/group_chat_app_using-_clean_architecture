import 'package:chat_clean_arch/feature/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/credentials/cubit/credential_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/user/cubit/user_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/pages/home_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/login_page.dart';
import 'package:chat_clean_arch/on_generate_route.dart';
import 'package:flutter/material.dart';
import 'package:chat_clean_arch/injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()..getUsers()),
      ],
      child: MaterialApp(
        title: 'Group Chat',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is AuthenticatedState) {
                  return HomePage(uid: authState.uid);
                } else {
                  return const LoginPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
