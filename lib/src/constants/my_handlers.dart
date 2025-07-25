import '../firestore/filestore_data.dart';

FirestoreService dbFetch = FirestoreService();
Future<String> fetchResumeUrl() async {
  String? resumeUrl = await dbFetch.fetchResumeUrl();
  if (resumeUrl != null) {
    return MyUrls.myResume = resumeUrl;
  }
  return "";
}
class MyUrls {
  static String myResume = fetchResumeUrl() as String;
  // static const String myResume = "https://drive.google.com/file/d/10ykuyK2buXBYG8wBmHiaU2Chj67JnVGt/view";
  static const String instagram = "https://www.instagram.com/_ash_2810/";
  static const String gmail = "mailto:yash2810203@gmail.com?subject=Visited your Portfolio&body=";
  static const String gitHub = "https://github.com/2810yash";
  static const String twitter = "https://twitter.com/_Yash_Wairagade?t=BLuBi93t0cLm_QAbZuHgPA&s=08";
  static const String linkedIn = "https://www.linkedin.com/in/yash-wairagade28/";
}
class MyUsername {
  static const String myNumber = '+91 9518524289';
  static const String myGmail = "yash2810203@gmail.com";
  static const String instagram = "@_ash_2810/";
  static const String gitHub = "2810yash";
  static const String twitter = "@_Yash_Wairagade";
  static const String linkedIn = "yash-wairagade28";
}