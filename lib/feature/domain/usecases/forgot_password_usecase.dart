import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

class ForgotPasswordUseCase {
  final FirebaseRepository repository;
  ForgotPasswordUseCase({required this.repository});

  Future<void> forgotPassword(String email) {
    return repository.fortgotPassword(email);
  }
}
