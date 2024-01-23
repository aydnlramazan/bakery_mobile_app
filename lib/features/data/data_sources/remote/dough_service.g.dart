// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dough_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DoughApiService implements DoughApiService {
  _DoughApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://192.168.1.2:7207';
  }

  final Dio _dio;
  String? baseUrl;
  Duration responseTimeout = const Duration(seconds: 30);

  @override
  Future<HttpResponse<List<DoughListModel>>> getListsByDate(
      {DateTime? date}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'date': date!.toIso8601String()};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<DoughListModel>>>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                receiveTimeout: responseTimeout)
            .compose(
              _dio.options,
              '/api/DoughFactory/GetByDateDoughFactoryList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => DoughListModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> addDoughProducts({
    int? userId,
    List<DoughProductToAddModel>? doughListProduct,
  }) async {
    print("userId: $userId");
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _headers = <String, dynamic>{};
    final _data = doughListProduct!.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                receiveTimeout: responseTimeout,
                sendTimeout: responseTimeout)
            .compose(
              _dio.options,
              '/api/DoughFactory/AddDoughFactoryListAndListDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<DoughAddedProductModel>>> getAddedProductsByListId(
      {int? doughFactoryListId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'doughFactoryListId': doughFactoryListId
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<DoughAddedProductModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      receiveTimeout: responseTimeout,
    )
            .compose(
              _dio.options,
              '/api/DoughFactory/GetAddedDoughFactoryListDetailByListId',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            DoughAddedProductModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<DoughProductModel>>> getAvailableProductsByListId(
      {int? listId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'doughFactoryListId': listId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<DoughProductModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      receiveTimeout: responseTimeout,
    )
            .compose(
              _dio.options,
              '/api/DoughFactory/GetNotAddedDoughFactoryListDetailByListId',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            DoughProductModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> deleteProductFromList({int? id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'detailId': id};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
      receiveTimeout: responseTimeout,
    )
            .compose(
              _dio.options,
              '/api/DoughFactory/DeleteDoughFactoryListDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> updateProductFromList(
      {DoughProductToAddModel? doughListProduct}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(doughListProduct!.toJson());
    final _result =
        await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      receiveTimeout: responseTimeout,
    )
            .compose(
              _dio.options,
              '/api/DoughFactory/UpdateDoughFactoryListDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
