enum DocumentCategories { resume, coverLetter }

extension DocumentCategoriesExtension on DocumentCategories {
  String get title {
    switch (this) {
      case DocumentCategories.resume:
        return 'Resume';
      case DocumentCategories.coverLetter:
        return 'Cover Letter';
    }
  }

  String get description {
    switch (this) {
      case DocumentCategories.resume:
        return 'Remember to include your most updated resume';
      case DocumentCategories.coverLetter:
        return 'Stand out with your cover letter';
    }
  }
}

class FileDocument {
  final String fileName;
  final DateTime uploadDate;
  final DocumentCategories category;
  final bool isSelected;

  FileDocument({
    required this.fileName,
    required this.uploadDate,
    required this.category,
    required this.isSelected,
  });
}
