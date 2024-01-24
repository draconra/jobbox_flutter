import 'package:flutter/material.dart';

import '../../model/job.dart';
import '../../model/file_document.dart';
import '../../model/user.dart';
import '../../model/data/data.dart';

class UserModelData with ChangeNotifier {
  // -- States --
  User? _loggedInUser;

  final List<FileDocument> _coverLetters = DocumentFiles.coverLetterFiles;
  final List<FileDocument> _resumes = DocumentFiles.resumeFiles;

  final List<Job> _appliedJobs = [];

  // -- UI --
  bool get isLoggedIn {
    return _loggedInUser != null;
  }

  String get fullName {
    return "${_loggedInUser?.firstName ?? ''} ${_loggedInUser?.lastName ?? ''}";
  }

  String get emailAddress {
    return _loggedInUser?.email ?? '';
  }

  String get mobileNumber {
    return "+${_loggedInUser?.mobileNumber ?? ''}";
  }

  Education? get education {
    return _loggedInUser?.education;
  }

  List<FileDocument> get resumes {
    return [..._resumes];
  }

  List<FileDocument> get coverLetters {
    return [..._coverLetters];
  }

  List<Job> get appliedJobs {
    return [..._appliedJobs];
  }

  String get greeting {
    return 'Hi ${_loggedInUser?.firstName ?? ''} 👋🏻';
  }

  FileDocument? get selectedResume {
    return _resumes.firstWhere((file) =>
        (file.category == DocumentCategories.resume) && file.isSelected);
  }

  FileDocument? get selectedCoverLetter {
    return _coverLetters.firstWhere((file) =>
        (file.category == DocumentCategories.coverLetter) && file.isSelected);
  }

  // UserModelData() {
  //   applyJob(Jobs.jobs.first);
  // }

  // -- Events --
  void login(String email, String password) {
    if (email != Users.user.email || password != Users.user.password) {
      return;
    }
    _loggedInUser = User(
      email: Users.user.email,
      password: Users.user.password,
      firstName: Users.user.firstName,
      lastName: Users.user.lastName,
      mobileNumber: Users.user.mobileNumber,
      education: Users.user.education,
    );
    notifyListeners();
  }

  void register(
    String email,
    String password,
    String reTypedPassword,
    VoidCallback onDone,
  ) {
    if (email.isEmpty || password.isEmpty || reTypedPassword.isEmpty) {
      return;
    }
    if (password.toLowerCase() != reTypedPassword.toLowerCase()) {
      return;
    }
    _loggedInUser = User(
      email: Users.user.email,
      password: Users.user.password,
      firstName: Users.user.firstName,
      lastName: Users.user.lastName,
      mobileNumber: Users.user.mobileNumber,
      education: Users.user.education,
    );
    notifyListeners();
    onDone();
  }

  void applyJob(Job job, {VoidCallback? onDone}) {
    final exists = _appliedJobs.any((j) => j.id == job.id);
    if (exists) {
      return;
    }
    _appliedJobs.add(job);
    notifyListeners();

    if (onDone != null) onDone();
  }

  bool isJobApplied(Job job) {
    final exists = _appliedJobs.any((j) => j.id == job.id);
    return exists;
  }
}
