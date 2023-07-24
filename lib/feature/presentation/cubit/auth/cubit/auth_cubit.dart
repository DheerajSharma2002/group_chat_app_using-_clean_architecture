import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_clean_arch/feature/domain/usecases/get_current_user_id_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/is_sign_in_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/sign_out_usecase.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCasee getCurrentUserIdUseCasee;
  final SignOutUseCase signOutUseCase;

  AuthCubit(
      {required this.getCurrentUserIdUseCasee,
      required this.isSignInUseCase,
      required this.signOutUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUserIdUseCasee.call();
        emit(AuthenticatedState(uid: uid));
      } else {
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  Future<void> loggedOm() async {
    try {
      final uid = await getCurrentUserIdUseCasee.call();
      emit(AuthenticatedState(uid: uid));
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  Future<void> loggedOut() async {
    try {
      signOutUseCase.signOut();
      emit(UnAuthenticatedState());
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }
}
