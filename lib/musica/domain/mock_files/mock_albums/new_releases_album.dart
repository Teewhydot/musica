import 'package:musica/generated/assets.dart';
import 'package:musica/musica/domain/entities/new_releases_model.dart';

List<NewReleasesModel> newReleasesList() {
  final list = [
    NewReleasesModel(Assets.imagesRectangle1),
    NewReleasesModel(Assets.imagesRectangle02),
    NewReleasesModel(Assets.imagesRectangle03),
    NewReleasesModel(Assets.imagesRectangle04),
    NewReleasesModel(Assets.imagesRectangle05),
    NewReleasesModel(Assets.imagesRectangle06),
    NewReleasesModel(Assets.imagesRectangle07),
    NewReleasesModel(Assets.imagesRectangle08),
    NewReleasesModel(Assets.imagesRectangle09),
    NewReleasesModel(Assets.imagesRectangle14),
  ];
  return list;
}
