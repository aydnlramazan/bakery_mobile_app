import 'package:bakery_app/core/constants/constants.dart';

import 'package:bakery_app/features/data/models/added_dough_list_product.dart';
import 'package:bakery_app/features/data/models/dough_list.dart';
import 'package:bakery_app/features/data/models/dough_list_product.dart';
import 'package:bakery_app/features/data/models/dough_product.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'dough_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DoughApiService {
  factory DoughApiService(Dio dio) = _DoughApiService;
  @GET("/api/DoughFactory/GetByDateDoughFactoryList")
  Future<HttpResponse<List<DoughListModel>>> getListsByDate({
    @Query("date") DateTime date
  });
  @POST("/api/DoughFactory/AddDoughFactoryListAndListDetail")
  Future<HttpResponse> addDoughProducts({@Query("userId") int userId, @Body() List<DoughListProductModel> doughListProduct});
  @GET("/api/DoughFactory/GetAddedDoughFactoryListDetailByListId")
  Future<HttpResponse<List<AddedDoughListProductModel>>> getAddedProductsByListId({
    @Query("listId") int listId
  });
  @GET("/api/DoughFactory/GetNotAddedDoughFactoryListDetailByListId")
  Future<HttpResponse<List<DoughProductModel>>> getAvailableProductsByListId({
    @Query("listId") int listId
  });

    @DELETE("/api/DoughFactory/DeleteDoughFactoryListDetail")
  Future<HttpResponse> deleteProductFromList({
    @Query("id") int id
  });

  @PUT("/api/DoughFactory/UpdateDoughFactoryListDetail")
   Future<HttpResponse> updateProductFromList({
    @Body() DoughListProductModel doughListProduct
  });
}
