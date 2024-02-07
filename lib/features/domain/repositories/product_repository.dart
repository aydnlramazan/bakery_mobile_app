import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/domain/entities/added_product.dart';
import 'package:bakery_app/features/domain/entities/product.dart';
import 'package:bakery_app/features/domain/entities/product_to_add.dart';

abstract class ProductRepository {
  Future<DataState<List<AddedProductEntity>>>getAddedProductsByDateAndCategoryId(DateTime date, int categoryId);
  Future<DataState<List<ProductEntity>>> getAvailableProductsByCategoryId(DateTime date, int categoryId);
  Future<DataState<String>> addProducts(int userId, int categoryId, List<ProductToAddEntity> productList);
  Future<DataState<void>> deleteProductById(int id);
  Future<DataState<void>> updateProduct(ProductToAddEntity product);
}
