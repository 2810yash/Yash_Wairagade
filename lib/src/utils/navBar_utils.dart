import 'package:flutter/material.dart';

class NavbarUtils {
  final Text text;
  final Icon icon;

  NavbarUtils({
    required this.text,
    required this.icon,
  });
}

List<NavbarUtils> navItems = [
  NavbarUtils(
    text: const Text('Home',style: TextStyle(color: Colors.white)),
    icon: const Icon(Icons.home_filled),
  ),
  NavbarUtils(
    text: const Text('Skills',style: TextStyle(color: Colors.white)),
    icon: const Icon(Icons.note_alt),
  ),
  NavbarUtils(
    text: const Text('Projects',style: TextStyle(color: Colors.white)),
    icon: const Icon(Icons.workspaces_outlined),
  ),
  NavbarUtils(
    text: const Text('Contact',style: TextStyle(color: Colors.white)),
    icon: const Icon(Icons.contact_mail),
  ),
  NavbarUtils(
    text: const Text('Resume',style: TextStyle(color: Colors.white)),
    icon: const Icon(Icons.document_scanner),
  ),
];