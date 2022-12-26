class GuardianModel {
  GuardianModel({
    required this.guardianId,
    required this.userId,
    required this.studentId,
    required this.nisn,
    // required this.nik,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.gender,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.dateSchoolNow,
    required this.address,
    required this.religion,
    required this.schoolOrigin,
    required this.schoolNow,
    required this.parentAddress,
    required this.motherProfession,
    required this.fatherProfession,
    required this.motherEducation,
    required this.fatherEducation,
    required this.familyAddress,
    required this.familyProfession,
    required this.phone,
    required this.image,
    required this.status,
  });

  int guardianId;
  int userId;
  int studentId;
  String nisn;
  // String nik;
  String firstName;
  String lastName;
  String fatherName;
  String motherName;
  String gender;
  String placeOfBirth;
  String dateOfBirth;
  String dateSchoolNow;
  String address;
  String religion;
  String schoolOrigin;
  String schoolNow;
  String parentAddress;
  String motherProfession;
  String fatherProfession;
  String motherEducation;
  String fatherEducation;
  String familyAddress;
  String familyProfession;
  dynamic phone;
  dynamic image;
  String status;

  factory GuardianModel.fromJson(Map<String, dynamic> json) => GuardianModel(
        guardianId: json["guardian_id"],
        userId: json["user_id"],
        studentId: json["student_id"],
        nisn: json["nisn"],
        // nik: json["nik"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        gender: json["gender"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"],
        dateSchoolNow: json["date_school_now"],
        address: json["address"],
        religion: json["religion"],
        schoolOrigin: json["school_origin"],
        schoolNow: json["school_now"],
        parentAddress: json["parent_address"],
        motherProfession: json["mother_profession"],
        fatherProfession: json["father_profession"],
        motherEducation: json["mother_education"],
        fatherEducation: json["father_education"],
        familyAddress: json["family_address"],
        familyProfession: json["family_profession"],
        phone: json["phone"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "guardian_id": guardianId,
        "user_id": userId,
        "student_id": studentId,
        "nisn": nisn,
        // "nik": nik,
        "first_name": firstName,
        "last_name": lastName,
        "father_name": fatherName,
        "mother_name": motherName,
        "gender": gender,
        "place_of_birth": placeOfBirth,
        "date_of_birth": dateOfBirth,
        "date_school_now": dateSchoolNow,
        "address": address,
        "religion": religion,
        "school_origin": schoolOrigin,
        "school_now": schoolNow,
        "parent_address": parentAddress,
        "mother_profession": motherProfession,
        "father_profession": fatherProfession,
        "mother_education": motherEducation,
        "father_education": fatherEducation,
        "family_address": familyAddress,
        "family_profession": familyProfession,
        "phone": phone,
        "image": image,
        "status": status,
      };
}
