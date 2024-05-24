import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/token/token_pref.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/component/resources/constant_methods.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

const String failureMessage = "Terjadi kesalahan, coba lagi";

@lazySingleton
class MyDio {
  late Dio dio;

  MyDio() {
    BaseOptions baseOptions = BaseOptions(
      headers: {"Accept": "application/json"},
      baseUrl: ApiDb.baseUrl,
      receiveDataWhenStatusError: true,
      followRedirects: false,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
      sendTimeout: const Duration(milliseconds: 50000),
    );
    dio = Dio(baseOptions);
  }
  Future<Either<ApiFailureResult, ApiSuccessResult>> formData({
    required String endPoint,
    Object? data,
  }) async {
    final currentToken = await TokenPref.getCurrentToken();
    /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
    dio.options.headers =
        DTO.checkBearerToken(token: currentToken!.token.toString());

    printResponse('base:    ${dio.options.baseUrl}');
    printResponse('url:    $endPoint');
    printResponse('header:    ${dio.options.headers}');

    try {
      var response = await dio.post(endPoint, data: data);

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return left(ApiFailureResult.unProccessable(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel(
                  code: response.statusCode,
                  message: response.data.toString())));
      }
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        log("PESAN KESALAHAN $e");
        return left(ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: e.error.toString())));
      }
    } catch (e) {
      log("PESAN KESALAHAN $e");
      return left(ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: e.toString())));
    }
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveDataWithImages({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Future<Map<String, dynamic>>? fromData,
  }) async {
    final currentToken = await TokenPref.getCurrentToken();
    /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
    dio.options.headers =
        DTO.checkBearerToken(token: currentToken!.token.toString());

    printResponse('base:    ${dio.options.baseUrl}');
    printResponse('url:    $endPoint');
    printResponse('header:    ${dio.options.headers}');
    printResponse('queryParameters:    $queryParameters');
    printResponse('fromData:    ${fromData.toString()}');

    try {
      var response = await dio.post(endPoint, data: json.encode(fromData));

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return left(ApiFailureResult.unProccessable(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel(
                  code: response.statusCode,
                  message: response.data.toString())));
      }
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        log("PESAN KESALAHAN $e");
        return left(ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: e.error.toString())));
      }
    } catch (e) {
      log("PESAN KESALAHAN $e");
      return left(ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: e.toString())));
    }
  }

  // MULTIPART DIO
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAnatomi({
    required String endPoint,
    required String nama,
    required String norm,
    required String picturePath,
    required String keterangan,
    Map<String, dynamic>? queryParameters,
  }) async {
    final currentToken = await TokenPref.getCurrentToken();

    /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
    dio.options.headers =
        DTO.checkBearerToken(token: currentToken!.token.toString());

    try {
      Future<FormData> createFormData() async {
        return FormData.fromMap({
          'nama': nama,
          'norm': norm,
          'keterangan': keterangan,
          'imageUrl': await MultipartFile.fromFile(
            picturePath,
          ),
        });
      }

      var response = await dio.post(endPoint, data: createFormData());

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return left(ApiFailureResult.unProccessable(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel(
                  code: response.statusCode,
                  message: response.data.toString())));
      }
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  // GET DATA WITH TOKEN
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDataWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final currentToken = await TokenPref.getCurrentToken();
    /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    
    */

    if (currentToken == null) {
      dio.options.headers = DTO.checkBearerToken(token: "");
    }

    if (currentToken != null) {
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken.token.toString());
    }

    try {
      var response =
          await dio.get(endPoint, queryParameters: queryParameters, data: data);

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');
      printResponse('data:    $data');
      printResponse('endpoint:    $endPoint');

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 202:
          return right(const ApiSuccessResult.emty());
        case 203:
          return right(ApiSuccessResult.auAutorized(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data)));
      }
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  // GET DATA WITHOUT TOKEN
  Future<Either<ApiFailureResult, ApiSuccessResult>> getData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return left(ApiFailureResult.unProccessable(value: response.data));
        case 203:
          return right(ApiSuccessResult.auAutorized(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
      }

      // SUCCES RESULT
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> download({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Directory appDocumentsDirectory =
          await getApplicationDocumentsDirectory();

      final String fileName = endPoint.split('/').last;
      final String filePath = '${appDocumentsDirectory.path}/$fileName';

      final dio = Dio();

      var response = await dio.download(endPoint, filePath);

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: filePath));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return left(ApiFailureResult.unProccessable(value: response.data));
        case 203:
          return right(ApiSuccessResult.auAutorized(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
      }
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> postDataWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool formData = true,
  }) async {
    final currentToken = await TokenPref.getCurrentToken();
    /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
    dio.options.headers =
        DTO.checkBearerToken(token: currentToken!.token.toString());

    printResponse('header:    ${dio.options.headers}');
    log("Data :$data");

    try {
      var response = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );

      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return right(const ApiSuccessResult.emty());
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel(
                  code: response.statusCode,
                  message: response.data.toString())));
      }
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> putDataWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool formData = true,
  }) async {
    final currentToken = await TokenPref.getCurrentToken();
    /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
    dio.options.headers =
        DTO.checkBearerToken(token: currentToken!.token.toString());

    printResponse('header:    ${dio.options.headers}');
    log("Data :$data");

    try {
      var response = await dio.put(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );

      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return right(const ApiSuccessResult.emty());
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel(
                  code: response.statusCode,
                  message: response.data.toString())));
      }
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  // GET DATA RETURN DYNAMIC
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      return response.data;
    } on DioExceptionType catch (e) {
      return MetaModel(code: 201, message: e.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }

  Future<dynamic> patch({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.patch(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      return response.data;
    } on DioExceptionType catch (e) {
      return MetaModel(code: 201, message: e.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }

  Future<dynamic> postPrivate({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final currentToken = await TokenPref.getCurrentToken();
      /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken!.token.toString());

      var response = await dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      return response.data;
    } on DioExceptionType catch (e) {
      return MetaModel(code: 201, message: e.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }

  Future<dynamic> putWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final currentToken = await TokenPref.getCurrentToken();
      /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken!.token.toString());

      var response = await dio.put(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      return response.data;
    } on DioExceptionType catch (e) {
      return MetaModel(code: 201, message: e.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }

  Future<dynamic> dynamicPatchWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final currentToken = await TokenPref.getCurrentToken();
      /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken!.token.toString());

      var response = await dio.patch(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      return response.data;
    } on DioExceptionType catch (e) {
      return MetaModel(code: 201, message: e.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }

  // DELETE DATA WITH TOKEN
  Future<Either<ApiFailureResult, ApiSuccessResult>> deleteWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final currentToken = await TokenPref.getCurrentToken();
      /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken!.token.toString());

      var response = await dio.delete(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return left(ApiFailureResult.unProccessable(value: response.data));
        case 203:
          return right(ApiSuccessResult.auAutorized(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
      }

      // SUCCES RESULT
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> patchWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final currentToken = await TokenPref.getCurrentToken();
      /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken!.token.toString());

      var response = await dio.patch(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      switch (response.statusCode) {
        case 200:
          return right(ApiSuccessResult.loaded(value: response.data));
        case 201:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
        case 202:
          return left(ApiFailureResult.unProccessable(value: response.data));
        case 203:
          return right(ApiSuccessResult.auAutorized(value: response.data));
        default:
          return left(ApiFailureResult.failure(
              meta: MetaModel.fromJson(response.data["metadata"])));
      }

      // SUCCES RESULT
    } on SocketException {
      return left(const ApiFailureResult.noConnection());
    } on FormatException {
      return left(const ApiFailureResult.connectionTimeOut());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ApiFailureResult.connectionTimeOut());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(const ApiFailureResult.disconectToServer());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(const ApiFailureResult.badResponse());
      } else {
        return left(const ApiFailureResult.failure(
            meta: MetaModel(code: 201, message: failureMessage)));
      }
    } catch (e) {
      return left(const ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: failureMessage)));
    }
  }

  Future<dynamic> deleteFressWithToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final currentToken = await TokenPref.getCurrentToken();
      /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken!.token.toString());

      var response = await dio.delete(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      return response.data;
    } on DioException catch (e) {
      return MetaModel(code: 201, message: e.error.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }

  // GET DATA RETURN DYNAMIC
  Future<dynamic> getAndToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final currentToken = await TokenPref.getCurrentToken();
      /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */
      dio.options.headers =
          DTO.checkBearerToken(token: currentToken!.token.toString());

      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');
      printResponse('data:    $data');

      return response.data;
    } on DioException catch (e) {
      return MetaModel(code: 201, message: e.error.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }

  Future<dynamic> postAndToken({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool formData = true,
  }) async {
    final currentToken = await TokenPref.getCurrentToken();
    /*
    Token diubah, di ambil dari Bearer Token,
    Tidak lagi diambil dari Header x-token
    */

    dio.options.headers =
        DTO.checkBearerToken(token: currentToken!.token.toString());

    printResponse('header:    ${dio.options.headers}');

    try {
      var response = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');

      return response.data;
    } on DioException catch (e) {
      return MetaModel(code: 201, message: e.error.toString());
    } catch (e) {
      return MetaModel(message: e.toString(), code: 201);
    }
  }
}
