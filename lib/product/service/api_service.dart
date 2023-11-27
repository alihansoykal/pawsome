// ignore_for_file: public_member_api_docs

import 'package:gen/gen.dart';
import 'package:pawsome/product/service/network/app_network_path.dart';
import 'package:vexana/vexana.dart';

final class ApiService {
  ApiService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<Response> randomImage() async {
    final response = await _networkManager.send<Response, Response>(
      AppNetworkPath.random.value,
      parseModel: Response(),
      method: RequestType.GET,
    );

    return response.data ?? Response();
  }
}
