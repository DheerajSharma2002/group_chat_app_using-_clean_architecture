import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';

import '../repositories/firebase_repository.dart';

class GetAllUsersUseCase {
  final FirebaseRepository repository;

  GetAllUsersUseCase({required this.repository});

  Stream<List<UserEntity>> getAllUser() {
    return repository.getAllUsers();
  }
}