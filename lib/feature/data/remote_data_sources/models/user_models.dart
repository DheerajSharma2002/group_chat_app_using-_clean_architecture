import '../../../domain/entities/user_entities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel({
    final String? name,
    final String? email,
    final String? phoneNumber,
    final String? isOnline,
    final String? uid,
    final String? status,
    final String? profileUrl,
    final String? password,
    final String? dob,
    final String? gender,
  }) : super(
          uid: uid,
          dob: dob,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          status: status,
          profileUrl: profileUrl,
          password: password,
          gender: gender,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      status: snapshot.get('status'),
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      phoneNumber: snapshot.get('phoneNumber'),
      isOnline: snapshot.get('isOnline'),
      uid: snapshot.get('uid'),
      gender: snapshot.get('gender'),
      profileUrl: snapshot.get('profileUrl'),
      password: snapshot.get('password'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "dob": dob,
      "email": email,
      "phoneNumber": phoneNumber,
      "isOnline": isOnline,
      "status": status,
      "profileUrl": profileUrl,
      "gender": gender,
    };
  }
}
