import '../../domain/entities/user_entities.dart';

abstract class FirebaseRemoteDataSource {
  //Credential Section
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> fortgotPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpdateUser(UserEntity user);
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<String> getCurrentUserId();

  //FIXME: missing methods
}
