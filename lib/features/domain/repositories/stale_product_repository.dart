
import 'package:bakery_app/features/domain/entities/product_not_added.dart';

import '../../../core/resources/data_state.dart';
import '../entities/stale_product_added.dart';
import '../entities/stale_product_to_add.dart';

abstract class StaleProductRepository{
  Future<DataState<List<StaleProductAddedEntity>>>getAddedStaleProductListByDate(DateTime date, int categoryId);
  Future<DataState<List<ProductNotAddedEntity>>> getProductProductListByDate(DateTime date, int categoryId);
  Future<DataState<void>> addStaleProduct(StaleProductToAddEntity staleProductToAdd);
  Future<DataState<void>> deleteStaleProduct(int id);
  Future<DataState<void>> updateStaleProduct(StaleProductToAddEntity staleProductToAdd);
}