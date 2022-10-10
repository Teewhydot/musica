import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
                  ),

                ],
              ),
            ),
          ],
        ),
      );
}

class DrawerItem extends StatelessWidget {
  final Widget image;
  final String text;
  final Widget preSpacing;
  final Widget midSpacing;

  const DrawerItem({Key? key, required this.image, required this.text, required this.preSpacing, required this.midSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          preSpacing,
          image,
          midSpacing,
          Text(
            text,
            style: mediumWhiteTextStyle,
          ),
        ],
      ),
    );
  }
}
