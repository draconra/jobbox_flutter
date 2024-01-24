class Education {
  final String school;
  final String course;
  final int graduationYear;

  Education({
    required this.school,
    required this.course,
    required this.graduationYear,
  });
}

class User {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final Education education;

  User({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.education,
  });
}
