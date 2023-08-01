import 'dart:io';

import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/domain/usecases/get_all_users_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/get_update_usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final GetUpdateUseCase getUpdateUseCase;
  UserCubit({required this.getUpdateUseCase, required this.getAllUsersUseCase})
      : super(UserInitial());

  Future<void> getUsers() async {
    try {
      getAllUsersUseCase.getAllUser().listen((listUsers) {
        emit(UserLoaded(users: listUsers));
      });
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> updateUser({required UserEntity user}) async {
    try {
      getUpdateUseCase.getUpdateUser(user);
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
