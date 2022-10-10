import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/my_collections_widget.dart';

class CollectionDetailsPage extends StatelessWidget {
  const CollectionDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.height / 1.5;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
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
        backgroundColor: Colors.transparent,
        title: Image.asset(
          Assets.iconsMusicicon,
          height: 25,
          width: 25,
        ),
      ),
      body: Column(
        children: [
          Stack(
          clipBehavior: Clip.none,
              children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    Assets.imagesSampleCollection,
                  ),
                ),
              ),
              height: height,
            ),
            Container(
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      backgroundColor,
                      Colors.transparent.withOpacity(0.5),
                    ],
                    // stops: [
                    //   0.0,
                    //   1.0
                    // ]
                  )),
            ),
            Positioned(
                top: 80, left: 20, child: MyCollectionsCard(onTap: () {})),
            const Positioned(
                bottom: 100,
                left: 40,
                child: Text(
                  'Tomorrows Tune\'s',
                  style: TextStyle(color: Color(0xffa4c7c6), fontSize: 25),
                )),
            const Positioned(
                bottom: 40,
                left: 40,
                child: Text(
                  'Lorem ipsum dolor sit amet\nConsectetur adipiscing elit ut aliquam,\nPurus sit amet luctus venenatis',
                  style: TextStyle(color: Color(0xffa4c7c6), fontSize: 15),
                )),

          ]),
          Container(
            width: width,
            height: totalHeight - height,
            decoration: const BoxDecoration(
              color: backgroundColor,
            ),
            child: Stack(
              clipBehavior: Clip.none,

              children: [
                Container(),
                Positioned(
                  top: -40,
                  left: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(Assets.iconsPlayAllIcon,height: 36,),
                        addHorizontalSpacing(5),
                        Image.asset(Assets.iconsAddToCollecIcon,height: 36,),
                        addHorizontalSpacing(5),
                        Image.asset(Assets.iconsLikeIcon,height: 36,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 1,
            //            child: Image.asset(Assets.iconsPlayAllIcon,height: 36,)),
            //       Expanded( flex: 2, child: Image.asset(Assets.iconsAddToCollecIcon,height: 36,)),
            //       Expanded( flex: 1, child: Image.asset(Assets.iconsLikeIcon,height: 36,)),
            //
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
