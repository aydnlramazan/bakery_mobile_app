import 'package:dio/dio.dart';

class Api {
  final dio = createDio();
  String _token = "";
  String _apiKey = "";

  Api();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: "http://192.168.1.2:7207",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
        }));

    return dio;
  }

  String get token => _token;

  set token(String? value) {
    if (value != null && value.isNotEmpty) {
      _token = value;
    }
  }

  String get apiKey => _apiKey;

  set apiKey(String? value) {
    if (value != null && value.isNotEmpty) {
      _apiKey = value;
    }
  }

  clearKeyToken() {
    _token = "";
    _apiKey = "";
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
  }) async {
    if (addRequestInterceptor) {
      _addRequestInterceptor();
    }
    return await dio.get(path,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters ,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
  }) async {
    print("URL : ${this.dio.options.baseUrl + path}");
    print("Request body : ${queryParameters}");
    if (addRequestInterceptor) {
      _addRequestInterceptor();
    }
    try {
      var response = await dio.post(path,
          data: FormData.fromMap(data),
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);
      print('Response: ${response.data}');
      return response;
    } catch (e) {
      print('Post Error: $e');
      throw e;
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
  }) async {
    if (addRequestInterceptor) {
      _addRequestInterceptor();
    }
    return await dio.put(path,
        data: FormData.fromMap(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
  }) async {
    if (addRequestInterceptor) {
      _addRequestInterceptor();
    }

    return await dio.delete(path,
        data: FormData.fromMap(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }

  void _addRequestInterceptor() {
    dio.interceptors.add(RequestInterceptor(apiKey: apiKey, token: token));
  }
}

class RequestInterceptor extends Interceptor {
  final String apiKey;
  final String token;

  RequestInterceptor({required this.token, required this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {'apiKey': apiKey, 'token': token};
    return handler.next(options);
  }
}
