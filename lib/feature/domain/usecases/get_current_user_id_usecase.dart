import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCasee {
  final FirebaseRepository repository;
  GetCurrentUserIdUseCasee({required this.repository});

  Future<String> call() {
    return repository.getCurrentUserId();
  }
}
