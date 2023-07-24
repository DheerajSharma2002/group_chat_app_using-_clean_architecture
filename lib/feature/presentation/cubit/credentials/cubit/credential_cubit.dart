import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/domain/usecases/forgot_password_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/get_current_user_id_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/google_auth_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/sign_in_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/sign_up_usecase.dart';
import 'package:equatable/equatable.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCurrentUserIdUseCasee getCurrentUserIdUseCasee;
  final GoogleauthUseCase googleauthUseCase;
  CredentialCubit(
      {required this.signInUseCase,
      required this.signUpUseCase,
      required this.forgotPasswordUseCase,
      required this.getCurrentUserIdUseCasee,
      required this.googleauthUseCase})
      : super(CredentialInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    try {
      signInUseCase.singIn(user);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) { 
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    try {
      await signUpUseCase.singUp(user);
      //await getCreateCurrentUserUseCase.getCreateCurrentUserUseCase();
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitGoogleauth({required UserEntity user}) async {
    try {
      googleauthUseCase.googleAuth();
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> forgotPassword({required UserEntity user}) async {
    try {
      forgotPasswordUseCase.forgotPassword(user.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}