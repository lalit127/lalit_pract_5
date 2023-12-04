class ResumeModel {
  int? id;
  String? userName;
  String? phoneNumber;
  List<String>? socialLinksList;
  List<String>? skillsList;
  List<String>? experienceList;

  ResumeModel({
    this.id,
    this.userName,
    this.phoneNumber,
    this.socialLinksList,
    this.skillsList,
    this.experienceList,
  });

  factory ResumeModel.fromMap(Map<String, dynamic> map) {
    return ResumeModel(
      id: map['id'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      socialLinksList: List<String>.from(map['socialLinksList']),
      skillsList: List<String>.from(map['skillsList']),
      experienceList: List<String>.from(map['experienceList']),
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