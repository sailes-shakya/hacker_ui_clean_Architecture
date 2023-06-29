import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackernews/core/utilis/api_utilis.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioBase {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: ApiUtils.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      )..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              handler.next(options);
            },
            onResponse: (response, requestionProvider) async {
              debugPrint(response.data.toString());
              requestionProvider.next(response);
            },
            onError: (error, errorInterceptionHanlder) async {
              errorInterceptionHanlder.next(error);
            },
          ),
        );
}
