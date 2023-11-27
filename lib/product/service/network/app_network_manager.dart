import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pawsome/product/init/config/enviroment_manager.dart';
import 'package:vexana/vexana.dart';

final class AppNetworkManager extends NetworkManager<EmptyModel> {
  AppNetworkManager.base()
      : super(
            options: BaseOptions(
          baseUrl: EnviromentItem.baseUrl.value,
        ));

  /// Handle error
  /// [onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
