import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;
  SignInUseCase({required this.repository});

  Future<void> singIn(UserEntity user) {
    return repository.signIn(user);
  }
}
