// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/musica/presentation/pages/screens/drawer/drawer_all_screens/my_collection/my_collections.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/drawer_item.dart';
import 'package:page_transition/page_transition.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: backgroundColor,
        child: Column(
          children: [
            addVerticalSpacing(50),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  DrawerItem(
                    image: Image.asset(
                      Assets.iconsHome,
                      height: 36,
                      width: 36,
                      fit: BoxFit.fill,
                    ),
                    text: 'Home',
                    preSpacing: addHorizontalSpacing(5),
                    midSpacing: addHorizontalSpacing(10),
                    onTapped: () {
                      Navigator.pop(context);
                    },
                  ),
                  addVerticalSpacing(30),
                  DrawerItem(
                    image: Image.asset(
                      Assets.iconsMycollections,
                      height: 24,
                      width: 23,
                      fit: BoxFit.fill,
                    ),
                    text: 'My collections',
                    preSpacing: addHorizontalSpacing(12),
                    midSpacing: addHorizontalSpacing(15),
                    onTapped: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const MyCollections(),
                              type: PageTransitionType.rightToLeft));
                    },
                  ),
                  addVerticalSpacing(30),
                  DrawerItem(
                    image: Image.asset(
                      Assets.iconsRadioicon,
                      height: 24,
                      width: 23,
                      fit: BoxFit.fill,
                    ),
                    text: 'Radio',
                    preSpacing: addHorizontalSpacing(12),
                    midSpacing: addHorizontalSpacing(15),
                    onTapped: () {},
                  ),
                  addVerticalSpacing(30),
                  DrawerItem(
                    image: Image.asset(
                      Assets.iconsMusicvideos,
                      height: 24,
                      width: 23,
                      fit: BoxFit.fill,
                    ),
                    text: 'Music Videos',
                    preSpacing: addHorizontalSpacing(12),
                    midSpacing: addHorizontalSpacing(15),
                    onTapped: () {},
                  ),
                  addVerticalSpacing(30),
                  DrawerItem(
                    image: Image.asset(
                      Assets.iconsProfile,
                      height: 24,
                      width: 23,
                      color: textColor,
                      fit: BoxFit.fill,
                    ),
                    text: 'Profile',
                    preSpacing: addHorizontalSpacing(12),
                    midSpacing: addHorizontalSpacing(15),
                    onTapped: () {},
                  ),
                  addVerticalSpacing(30),
                  DrawerItem(
                    image: Image.asset(
                      Assets.iconsLogouticon,
                      height: 24,
                      width: 23,
                      fit: BoxFit.fill,
                      color: textColor,
                    ),
                    text: 'Log out',
                    preSpacing: addHorizontalSpacing(12),
                    midSpacing: addHorizontalSpacing(15),
                    onTapped: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
