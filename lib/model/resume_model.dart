

import 'dart:typed_data';

class ResumeModel {
  int? id;
  String? userName;
  String? phoneNumber;
  String? socialLinksList;
  String? skillsList;
  String? experienceList;
  // Uint8List? profilePicture;

  ResumeModel({
    this.id,
    this.userName,
    this.phoneNumber,
    this.socialLinksList,
    this.skillsList,
    this.experienceList,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> map) {
    return ResumeModel(
      id: map['id'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      socialLinksList: map['socialLinksList'],
      skillsList: map['skillsList'],
      experienceList: map['experienceList'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'socialLinksList': socialLinksList,
      'skillsList': skillsList,
      'experienceList': experienceList,
    };
  }
}