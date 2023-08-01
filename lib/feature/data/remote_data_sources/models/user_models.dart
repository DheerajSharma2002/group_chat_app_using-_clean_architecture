import '../../../domain/entities/user_entities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel({
     String name="username",
     String email = "",
     String phoneNumber="",
     bool isOnline=false,
     String uid="",
     String status="",
     String profileUrl="",
     String password="",
     String dob="",
     String gender="",
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
