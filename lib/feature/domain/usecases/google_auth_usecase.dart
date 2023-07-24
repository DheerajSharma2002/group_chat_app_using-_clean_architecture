import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

class GoogleauthUseCase {
  final FirebaseRepository repository;
  GoogleauthUseCase({required this.repository});

  Future<void> googleAuth() {
    return repository.googleAuth();
  }
}
