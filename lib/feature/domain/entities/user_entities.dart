import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? isOnline;
  final String? uid;
  final String? status;
  final String? profileUrl;
  final String? password;
  final String? dob;
  final String? gender;

  UserEntity(
      {this.name,
      this.email,
      this.phoneNumber,
      this.isOnline,
      this.uid,
      this.status,
      this.profileUrl,
      this.password,
      this.dob,
      this.gender});

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        isOnline,
        uid,
        status,
        profileUrl,
        password,
        dob,
        gender
      ];
}
