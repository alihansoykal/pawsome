abstract class BreedsEvent {}

class FetchBreedsAndImagesEvent extends BreedsEvent {}

abstract class BreedsState {}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {}

class BreedsLoaded extends BreedsState {
  final Map<String, String> breedImages;
  final Map<String, String> filteredBreedImages;
  final String searchText;

  BreedsLoaded(
      {required this.breedImages, this.filteredBreedImages = const {}, this.searchText = '' // Initialize searchText
      });
}

class BreedsError extends BreedsState {
  final String message;
  BreedsError({required this.message});
}

class FilterBreedsEvent extends BreedsEvent {
  final String filter;
  FilterBreedsEvent(this.filter);
}
