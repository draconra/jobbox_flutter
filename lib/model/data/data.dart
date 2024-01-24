import '../../util/theme/icons.dart';
import '../../model/user.dart';
import '../../model/job.dart';
import '../../model/file_document.dart';
import '../../model/skill.dart';

// -- Dummy User --
class Users {
  static User user = User(
    email: 'Adrianseverin@gmail.com',
    password: 'adrianseverin',
    firstName: 'Adrian',
    lastName: 'Severin',
    mobileNumber: '6594717281',
    education: Education(
      school: 'Horizon Education University',
      course: 'Data Analytics',
      graduationYear: 2012,
    ),
  );
}

// -- Dummy Jobs --
class Jobs {
  static String dummyDesc = 'Developing product design concepts from client requirements';
  static List<Job> jobs = [
    Job(
      id: 'j1',
      logo: AppLogos.slack,
      companyName: 'Slack',
      positionTitle: 'Senior Product Designer',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        dummyDesc,
        dummyDesc,
        dummyDesc,
        dummyDesc,
        dummyDesc
      ],
      datePosted: DateTime(2023, 9, 9),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 6000,
        maximum: 8000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.east),
      isNearby: false,
    ),
    Job(
      id: 'j2',
      logo: AppLogos.cryptoDotCom,
      companyName: 'Crypto.com',
      positionTitle: 'Front-End Developer',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        dummyDesc,
        dummyDesc,
        dummyDesc,
        dummyDesc,
        dummyDesc
      ],
      datePosted: DateTime(2023, 9, 9),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 5000,
        maximum: 6000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.central),
      isNearby: true,
    ),
    Job(
      id: 'j3',
      logo: AppLogos.amazon,
      companyName: 'Amazon',
      positionTitle: 'Product Owner',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        dummyDesc,
        dummyDesc,
        dummyDesc,
        dummyDesc,
        dummyDesc
      ],
      datePosted: DateTime(2023, 9, 7),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 8000,
        maximum: 10000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.west),
      isNearby: false,
    ),
    Job(
      id: 'j4',
      logo: AppLogos.asana,
      companyName: 'Asana',
      positionTitle: 'Business Analyst',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements'
      ],
      datePosted: DateTime(2023, 9, 6),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 7000,
        maximum: 8000,
      ),
      country:
          const Country(name: 'Singapore', direction: Directions.northEast),
      isNearby: false,
    ),
    Job(
      id: 'j5',
      logo: AppLogos.google,
      companyName: 'Google',
      positionTitle: 'Senior Product Designer',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements'
      ],
      datePosted: DateTime(2023, 9, 6),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 8000,
        maximum: 10000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.central),
      isNearby: true,
    )
  ];
}

// -- Dummy Files --
class DocumentFiles {
  static final resumeFiles = [
    FileDocument(
      fileName: 'My resume.pdf',
      uploadDate: DateTime(2023, 6, 11),
      category: DocumentCategories.resume,
      isSelected: true,
    ),
  ];
  static final coverLetterFiles = [
    FileDocument(
      fileName: 'My cover letter final.doc',
      uploadDate: DateTime(2023, 6, 11),
      category: DocumentCategories.coverLetter,
      isSelected: true,
    ),
    FileDocument(
        fileName: 'My cover letter.doc',
        uploadDate: DateTime(2023, 6, 6),
        category: DocumentCategories.coverLetter,
        isSelected: false),
  ];
}

// -- Dummy Skills --
class Skills {
  static const skills = [
    Skill(id: 's1', name: 'Figma'),
  ];
}
