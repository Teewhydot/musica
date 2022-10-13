import 'package:flutter/material.dart';
import 'package:musica/models/new_releases_model.dart';

class NewReleasesWidget extends StatelessWidget {
  final String image;

  const NewReleasesWidget({super.key, required this.image});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
        height: 153,
        width: 153,
      ),
    );
  }
}




class ReleasesWidget extends StatelessWidget {
  const ReleasesWidget({
    Key? key,
    required this.newReleasesModelList,
  }) : super(key: key);

  final List<NewReleasesModel> newReleasesModelList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 153,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newReleasesModelList.length,
          itemBuilder: (context, index) {
            return NewReleasesWidget(
              image: newReleasesModelList[index].image,
            );
          }),
    );
  }
}
