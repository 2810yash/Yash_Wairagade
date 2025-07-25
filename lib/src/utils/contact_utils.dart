import '../constants/my_handlers.dart';

class ContactUtils {
  final String icon;
  final String link;

  ContactUtils({
    required this.icon,
    required this.link,
  });
}

List<ContactUtils> contacts = [
  ContactUtils(
    icon: 'assets/images/gitHub.png',
    link: MyUrls.gitHub,
  ),
  ContactUtils(
    icon: 'assets/images/linkedIn.png',
    link: MyUrls.linkedIn,
  ),
  ContactUtils(
    icon: 'assets/images/insta.png',
    link: MyUrls.instagram,
  ),
  ContactUtils(
    icon: 'assets/images/twitter.png',
    link: MyUrls.twitter,
  ),
];