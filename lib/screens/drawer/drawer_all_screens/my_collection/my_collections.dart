// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/my_collections_widget.dart';
import 'package:musica/screens/drawer/drawer_all_screens/my_collection/collection_details_page.dart';
import 'package:page_transition/page_transition.dart';

class MyCollections extends StatefulWidget {
  const MyCollections({Key? key}) : super(key: key);

  @override
  State<MyCollections> createState() => _MyCollectionsState();
}

class _MyCollectionsState extends State<MyCollections> {
  bool isCActive = false;
  bool isLActive = false;
  @override
  Widget build(BuildContext context) {
    const Color activeColor = buttonPlayColor;
    final Color inactiveColor = textColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: textColor,
              size: 30,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Image.asset(
          Assets.iconsMusicicon,
          height: 25,
          width: 25,
        ),
      ),
      body: ListView(
        children: [
          addVerticalSpacing(20),
          Row(
            children: [
              Expanded(
                  child: RowOption(
                text: Text(
                  'My collections',
                  style: mediumWhiteTextStyle.copyWith(
                      color: isCActive ? activeColor : inactiveColor),
                ),
                onTap: () {
                  setState(() {
                    isCActive = isCActive ? false : true;
                  });
                },
              )),
              addHorizontalSpacing(10),
              Expanded(
                  child: RowOption(
                text: Text(
                  'Likes',
                  style: mediumWhiteTextStyle.copyWith(
                      color: isLActive ? activeColor : inactiveColor),
                ),
                onTap: () {
                  setState(() {
                    isLActive = isLActive ? false : true;
                  });
                },
              )),
            ],
          ),
          Column(
            children:  [
              MyCollectionsCard(onTap: (){
                Navigator.push(context, PageTransition(child: const CollectionDetailsPage(), type: PageTransitionType.rightToLeft));
              },),
            ],
          ),
        ],
      ),
    );
  }
}

class RowOption extends StatelessWidget {
  final Widget text;
  final onTap;

  const RowOption({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 37,
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(color: textColor),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: text),
      ),
    );
  }
}
