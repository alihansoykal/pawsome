// Project service path
// ignore_for_file: public_member_api_docs

enum AppNetworkPath {
  breeds('breeds'),
  image('image'),
  images('images'),
  random('breeds/image/random');

  final String value;
  const AppNetworkPath(this.value);

  /// [listAllBreeds]
  ///
  /// Example: breeds/list/all
  String listAllBreeds() {
    return 'breeds/list/all';
  }

  /// [randomImage]
  ///
  /// Example: breeds/image/random
  String randomImage() {
    return 'breeds/image/random';
  }

  /// [getImagesForBreed]
  ///
  /// Example: breed/{breed}/images
  String getImagesForBreed(String breed) {
    return 'breed/$breed/images';
  }

  /// [listSubBreeds]
  ///
  /// Example: breed/{breed}/list
  String listSubBreeds(String breed) {
    return 'breed/$breed/list';
  }

  /// [randomImageForBreed]
  ///
  /// Example: breed/{breed}/images/random
  String randomImageForBreed(String breed) {
    return 'breed/$breed/images/random';
  }
}
