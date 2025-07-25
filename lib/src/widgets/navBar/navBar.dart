import 'package:flutter/material.dart';
import 'package:projects/src/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/my_handlers.dart';
import '../../utils/navBar_utils.dart';

class ResponsiveNavBarPage extends StatelessWidget
    implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isLargeScreen;

  const ResponsiveNavBarPage(
      {required this.scaffoldKey, required this.isLargeScreen, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20.0),
            const Text(
              "YW",
              style:
                  TextStyle(color: CustomColor.bluePrimary, fontWeight: FontWeight.bold),
            ),
            if (isLargeScreen) Expanded(child: _navBarItems()),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            child: InkWell(
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(Icons.person_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < navItems.length; i++)
            i == 4
                ? OutlinedButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      shadowColor:
                          WidgetStateProperty.all(CustomColor.transparentColor),
                      backgroundColor:
                          WidgetStateProperty.all(CustomColor.transparentColor),
                      side: WidgetStateProperty.all(
                        const BorderSide(color: Colors.blue),
                      ),
                    ),
                    onPressed: () => launchUrl(Uri.parse(MyUrls.myResume)),
                    child: navItems[i].text,
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      shadowColor:
                          WidgetStateProperty.all(CustomColor.transparentColor),
                      backgroundColor: WidgetStateProperty.all(
                        CustomColor.transparentColor,
                      ),
                    ),
                    onPressed: () {},
                    child: navItems[i].text,
                  ),
        ],
      );
}

enum Menu { itemOne, itemTwo, itemThree }