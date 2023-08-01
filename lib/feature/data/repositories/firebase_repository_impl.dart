import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';

import '../remote_data_sources/firebase_remote_data_source.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;
  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  @override
  Future<void> fortgotPassword(String email) async =>
      remoteDataSource.fortgotPassword(email);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUserId() async =>
      remoteDataSource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity user) async =>
      remoteDataSource.getUpdateUser(user);

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async => remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Future<void> googleAuth() async => remoteDataSource.googleAuth();

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();
}
