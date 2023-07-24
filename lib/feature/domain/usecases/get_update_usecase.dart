import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

class GetUpdateUseCase {
  final FirebaseRepository repository;
  GetUpdateUseCase({required this.repository});

  Future<void> getUpdateUser(UserEntity user) {
    return repository.getUpdateUser(user);
  }
}
