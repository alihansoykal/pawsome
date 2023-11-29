import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:pawsome/product/init/navigation/app_router.dart';
import 'package:pawsome/product/state/bloc/breeds_bloc.dart';
import 'package:pawsome/product/state/bloc/breeds_event.dart';
import 'package:pawsome/product/utility/extension/asset_extensions.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    context.read<BreedsBloc>().add(FetchBreedsAndImagesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BreedsBloc, BreedsState>(
        listener: (context, state) {
          if (state is BreedsLoaded) {
            context.router.replace(const DashboardRoute());
          }
          if (state is BreedsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message}")),
            );
          }
        },
        child: Center(
          child: Assets.images.imgSplashLogo.asImage,
        ),
      ),
    );
  }
}
