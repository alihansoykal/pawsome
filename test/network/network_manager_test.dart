import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:pawsome/product/init/config/enviroment_manager.dart';
import 'package:pawsome/product/service/network/app_network_manager.dart';
import 'package:pawsome/product/service/network/app_network_path.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final AppNetworkManager manager;
  setUp(() {
    EnviromentManager.setup(DevEnv());
    manager = AppNetworkManager.base();
  });

  test('get a random image', () async {
    final response = await manager.send<Response, Response>(
      AppNetworkPath.random.value,
      parseModel: Response(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
  });
}
