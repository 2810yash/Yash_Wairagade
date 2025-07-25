
class oldProjectUtils {
  final String image;
  final String title;
  final String description;
  final List<String> tags;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? gitHubLink;

  oldProjectUtils({
    required this.image,
    required this.title,
    required this.description,
    required this.tags,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.gitHubLink,
  });
}

List<oldProjectUtils> projects = [
  oldProjectUtils(
    image: 'assets/project_images/carbon_fpts.jpg',
    title: "Carbon FootPrint Calculator",
    description:
        "Created an application to calculate carbon footprints for individuals or organizations, offering guidance on effective management. Utilized Flutter for frontend development and Firebase for backend integration.",
    tags: ["Dart", "Flutter"],
    gitHubLink: "https://github.com/2810yash/CFC",
    androidLink: null,
    iosLink: null,
    webLink: "https://carbon-footprints.web.app/",
  ),
  oldProjectUtils(
    image: 'assets/project_images/python_project.png',
    title: "Attendance Monitoring System",
    description:
        "Engineered an interface using Python libraries to interact with a webcam for facial recognition and attendance marking. Implemented backend processing to store attendance records.",
    tags: ["OpenCV", "Python"],
    gitHubLink: "https://github.com/2810yash/Attendance-Management-System.git",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
  oldProjectUtils(
    image: 'assets/project_images/logical_gate.jpg',
    title: "Logic Gate Implementation",
    description:
        "Designed an interface using C++ libraries where users select a logic gate and input numbers to generate corre- sponding outputs.",
    tags: ["C++"],
    gitHubLink:
        "https://github.com/2810yash/Advanced-CPP/tree/main/Our%20Project",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
  oldProjectUtils(
    image: 'assets/project_images/prj4.png',
    title: "IOIT-ACM",
    description:
        "Built a user-friendly application for the IOIT ACM student chapter, featuring registration management and attendee tracking. Successfully deployed during IOIT MUN, enhancing event coordination and engagement. Used Flutter for frontend and Firebase for backend services.",
    tags: ["Dart", "Flutter", "Firebase"],
    gitHubLink: "https://github.com/2810yash/acn-ioit",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
  oldProjectUtils(
    image: 'assets/project_images/expence_tracker.jpg',
    title: "Expense Tracker",
    description:
        "Constructed a full-stack application to track individual expenses using a local database (Hive) for efficient data storage and retrieval.",
    tags: ["Dart", "Flutter", "Firebase", "Hive"],
    gitHubLink: "https://github.com/2810yash/expense_tracker",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
];