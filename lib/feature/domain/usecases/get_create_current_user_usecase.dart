import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

// class GetCreateCurrentUserUseCase {
//   final FirebaseRepository repository;
//   GetCreateCurrentUserUseCase({required this.repository});

//   Future<void> call(UserEntity user) async {
//     return repository.getCreateCurrentUser(user);
//   }
// }

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.getCreateCurrentUser(user);
  }
}
