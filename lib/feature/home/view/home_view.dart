import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pawsome/product/service/api_service.dart';

import '../../../product/state/container/app_state_items.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ApiService apiService;
  @override
  void initState() {
    super.initState();
    apiService = ApiService(AppStateItems.appNetworkManager);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home'),
          ElevatedButton(
              onPressed: () async {
                Response response = await apiService.randomImage();
                print("response: $response");
              },
              child: const Text("data"))
        ],
      ),
    ));
  }
}
