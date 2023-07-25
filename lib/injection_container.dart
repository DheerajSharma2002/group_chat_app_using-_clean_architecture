import 'package:chat_clean_arch/feature/data/remote_data_sources/firebase_remote_data_source_impl.dart';
import 'package:chat_clean_arch/feature/data/repositories/firebase_repository_impl.dart';
import 'package:chat_clean_arch/feature/domain/repositories/firebase_repository.dart';
import 'package:chat_clean_arch/feature/domain/usecases/get_create_current_user_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/get_current_user_id_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/google_auth_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/is_sign_in_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/sign_in_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/sign_out_usecase.dart';
import 'package:chat_clean_arch/feature/domain/usecases/sign_up_usecase.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/credentials/cubit/credential_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      getCurrentUserIdUseCasee: sl.call(),
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call()));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      signInUseCase: sl.call(),
      signUpUseCase: sl.call(),
      forgotPasswordUseCase: sl.call(),
      getCurrentUserIdUseCasee: sl.call(),
      googleauthUseCase: sl.call()));

  //UseCases
  //AuthCubit UseCases
  sl.registerLazySingleton<GetCurrentUserIdUseCasee>(
      () => GetCurrentUserIdUseCasee(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));

  //CredentialCubit UseCases
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GoogleauthUseCase>(
      () => GoogleauthUseCase(repository: sl.call()));

  //Repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  //RemoteData Source
  sl.registerLazySingleton<FirebaseRemoteDataSourceImpl>(() =>
      FirebaseRemoteDataSourceImpl(
          fireStore: sl.call(), auth: sl.call(), googleSignIn: sl.call()));

  //LocalData source

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);
}
