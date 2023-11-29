import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pawsome/product/service/api_service.dart';
import 'package:pawsome/product/state/bloc/breeds_event.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final ApiService apiService;
  final Box hiveBox;

  BreedsBloc({required this.apiService, required this.hiveBox}) : super(BreedsInitial()) {
    on<FetchBreedsAndImagesEvent>(_onFetchBreedsAndImages);
    on<FilterBreedsEvent>(_onFilterBreeds);
  }

  Future<void> _onFetchBreedsAndImages(FetchBreedsAndImagesEvent event, Emitter<BreedsState> emit) async {
    try {
      emit(BreedsLoading());
      var breedsListResponse = await apiService.breedsList();
      Map<String, String> breedImages = {};

      for (var breed in breedsListResponse.message.keys) {
        var imageResponse = await apiService.imageList(breed);
        breedImages[breed] = imageResponse.message.isNotEmpty ? imageResponse.message.first : '';
      }

      await hiveBox.put('breedImages', breedImages);

      emit(BreedsLoaded(breedImages: breedImages));
    } catch (e) {
      emit(BreedsError(message: e.toString()));
    }
  }

  void _onFilterBreeds(FilterBreedsEvent event, Emitter<BreedsState> emit) {
    if (state is BreedsLoaded) {
      final fullBreedImages = (state as BreedsLoaded).breedImages;
      Map<String, String> filteredBreedImages = {};

      if (event.filter.isNotEmpty) {
        filteredBreedImages = Map.fromEntries(
            fullBreedImages.entries.where((entry) => entry.key.toLowerCase().contains(event.filter.toLowerCase())));
      }

      emit(BreedsLoaded(
          breedImages: fullBreedImages, filteredBreedImages: filteredBreedImages, searchText: event.filter));
    }
  }
}
