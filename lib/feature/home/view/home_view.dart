// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:hive/hive.dart';
import 'package:pawsome/feature/home/view_model/state/home_state.dart';
import 'package:pawsome/feature/home/view_model/state/home_state_event.dart';
import 'package:pawsome/product/init/language/locale_keys.g.dart';
import 'package:pawsome/product/service/api_service.dart';
import 'package:pawsome/product/state/bloc/breeds_bloc.dart';
import 'package:pawsome/product/state/bloc/breeds_event.dart';
import 'package:pawsome/product/utility/extension/context_extension.dart';
import 'package:pawsome/product/utility/extension/string_localization.dart';

import '../../../product/state/container/app_state_items.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final DraggableMenuController _draggableMenuController;
  late final TextEditingController _textEditingController;

  @override
  late final ApiService apiService;
  @override
  Map<String, String> breedImages = {};

  @override
  void initState() {
    super.initState();
    _draggableMenuController = DraggableMenuController();
    _textEditingController = TextEditingController();
    apiService = ApiService(AppStateItems.appNetworkManager);
    _loadBreedImages();
  }

  void _loadBreedImages() {
    final box = Hive.box('breedImages');
    breedImages = box.get('breedImages', defaultValue: {}) as Map<String, String>;
  }

  @override
  void dispose() {
    _draggableMenuController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _showRandomImageBottomSheet(BuildContext context, String breed) {
    final box = Hive.box('breedImages');
    String randomImageUrl = box.get('randomImage_$breed', defaultValue: '');

    showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: context.width * 0.68,
              width: context.width * 0.68,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(randomImageUrl),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.popRoute();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                backgroundColor: Colors.white,
                fixedSize: const Size(32, 32),
                minimumSize: const Size(32, 32),
              ),
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );

    _updateRandomImageCache(breed);
  }

  void _updateRandomImageCache(String breed) async {
    final randomImageResponse = await apiService.generateImage(breed);
    final box = Hive.box('breedImages');
    box.put('randomImage_$breed', randomImageResponse.message);
  }

  void _showBreedDetails(BuildContext context, String breed, String imageUrl) async {
    final subBreedsResponse = await apiService.simpleList(breed);
    final subBreeds = subBreedsResponse.message;
    final randomImageResponse = await apiService.generateImage(breed);
    final box = Hive.box('breedImages');
    box.put('randomImage_$breed', randomImageResponse.message);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.1, vertical: context.height * 0.05),
          child: SingleChildScrollView(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                  color: AppColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.network(imageUrl,
                          height: context.height * 0.4, width: context.width * 0.8, fit: BoxFit.cover),
                      IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 32,
                        ),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.02),
                  Text(
                    LocaleKeys.home_dialog_title.locale,
                    style: textTheme.titleMedium,
                  ),
                  const Divider(
                    color: AppColors.surface,
                    thickness: 0.4,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Text(breed, style: textTheme.titleSmall),
                  SizedBox(height: context.height * 0.02),
                  Text(LocaleKeys.home_dialog_subtitle.locale, style: textTheme.titleMedium),
                  const Divider(
                    color: AppColors.surface,
                    thickness: 0.4,
                    indent: 30,
                    endIndent: 30,
                  ),
                  for (var subBreed in subBreeds) Text(subBreed, style: textTheme.titleSmall),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      width: context.width * 0.7,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(context.width * 0.77, context.height * 0.06),
                            backgroundColor: AppColors.outline,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            _showRandomImageBottomSheet(context, breed);
                          },
                          child: Center(
                              child: Text(LocaleKeys.home_dialog_generate.locale, style: textTheme.labelMedium))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  TextTheme textTheme = AppStateItems.customLightTheme.textThemeData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(alignment: Alignment.bottomCenter, children: [
        Expanded(
          child: BlocBuilder<BreedsBloc, BreedsState>(builder: (context, state) {
            if (state is BreedsLoaded) {
              if (state.filteredBreedImages.isNotEmpty) {
                breedImages = state.filteredBreedImages;
              } else if (state.filteredBreedImages.isEmpty && _textEditingController.text.isNotEmpty) {
                breedImages = {};
              } else if (state.filteredBreedImages.isEmpty && _textEditingController.text.isEmpty) {
                breedImages = state.breedImages;
              }

              return breedImages.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemCount: breedImages.length,
                      itemBuilder: (context, index) {
                        String breed = breedImages.keys.elementAt(index);
                        String imageUrl = breedImages[breed] ?? '';
                        return GestureDetector(
                          onTap: () {
                            _showBreedDetails(context, breed, imageUrl);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.surface,
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          imageUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(8),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              breed,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))),
                          ),
                        );
                      },
                    )
                  : Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.home_textInput_noResult.locale,
                              style: textTheme.displayMedium,
                            ),
                            SizedBox(height: context.height * 0.02),
                            Text(
                              LocaleKeys.home_textInput_tryAgain.locale,
                              style: textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ),
                    );
            } else if (state is BreedsError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(double.maxFinite, 56),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () async {
                await DraggableMenu.open(
                    context,
                    DraggableMenu(
                      controller: _draggableMenuController,
                      ui: const ClassicDraggableMenu(
                        color: Colors.white,
                      ),
                      levels: [
                        DraggableMenuLevel.ratio(ratio: 1 / 5),
                        DraggableMenuLevel.ratio(ratio: 3 / 5),
                      ],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: (context.height * 0.2).toInt(),
                          controller: _textEditingController,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintStyle: textTheme.bodySmall,
                            hintText: LocaleKeys.home_textInput_search.locale,
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            context.read<TextBloc>().add(TextFieldChanged(value));
                            BlocProvider.of<BreedsBloc>(context).add(FilterBreedsEvent(value));
                          },
                        ),
                      ),
                    ));
              },
              child: BlocBuilder<TextBloc, TextWidgetState>(
                builder: (context, state) {
                  return Text(
                    state.text.isEmpty ? LocaleKeys.home_textInput_search.locale : state.text,
                    style: textTheme.bodySmall,
                  );
                },
              )),
        ),
      ])),
    );
  }
}
