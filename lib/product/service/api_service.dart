// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:gen/gen.dart';
import 'package:pawsome/product/service/network/app_network_path.dart';
import 'package:vexana/vexana.dart';

final class ApiService {
  ApiService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  Future<RandomImageResponse> randomImage() async {
    final response = await _networkManager.send<RandomImageResponse, RandomImageResponse>(
      AppNetworkPath.random.value,
      parseModel: const RandomImageResponse(),
      method: RequestType.GET,
    );

    return response.data ?? const RandomImageResponse();
  }

  Future<BreedListResponse> breedsList() async {
    final response = await _networkManager.send<BreedListResponse, BreedListResponse>(
      "breeds/list/all",
      parseModel: const BreedListResponse(message: {}),
      method: RequestType.GET,
    );

    return response.data ?? const BreedListResponse(message: {});
  }

  Future<SimpleListResponse> simpleList(String breed) async {
    final response = await _networkManager.send<SimpleListResponse, SimpleListResponse>(
      "breed/$breed/list",
      parseModel: const SimpleListResponse(message: []),
      method: RequestType.GET,
    );

    return response.data ?? const SimpleListResponse(message: []);
  }

  Future<ImageListResponse> imageList(String breed) async {
    try {
      final response = await _networkManager.send<ImageListResponse, ImageListResponse>(
        "breed/$breed/images",
        parseModel: const ImageListResponse(message: []),
        method: RequestType.GET,
      );

      return response.data ?? const ImageListResponse(message: []);
    } catch (e) {
      if (e is HttpException) {
        return const ImageListResponse(message: []);
      }
      rethrow;
    }
  }

  Future<RandomImageResponse> generateImage(String breed) async {
    final response = await _networkManager.send<RandomImageResponse, RandomImageResponse>(
      "breed/$breed/images/random",
      parseModel: const RandomImageResponse(),
      method: RequestType.GET,
    );

    return response.data ?? const RandomImageResponse();
  }
}
