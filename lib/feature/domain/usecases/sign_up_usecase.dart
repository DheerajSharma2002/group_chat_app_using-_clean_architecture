import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;
  SignUpUseCase({required this.repository});

  Future<void> singUp(UserEntity user) {
    return repository.signUp(user);
  }
}
