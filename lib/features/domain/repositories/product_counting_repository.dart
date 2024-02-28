
import 'package:bakery_app/features/domain/entities/product_counting_added.dart';

import '../../../core/resources/data_state.dart';
import '../entities/product_counting_to_add.dart';
import '../entities/product_not_added.dart';

abstract class ProductCountingRepository {
  Future<DataState<List<ProductCountingAddedEntity>>>getAddedProductsByDateAndCategoryId(DateTime date, int categoryId);
  Future<DataState<List<ProductNotAddedEntity>>> getNotAddedProductsByDateAndCategoryId(DateTime date, int categoryId);
  Future<DataState<String>> addProduct(ProductCountingToAddEntity product);
  Future<DataState<void>> deleteProductById(int id);
  Future<DataState<void>> updateProduct(ProductCountingToAddEntity product);
}