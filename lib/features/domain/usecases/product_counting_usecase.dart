import 'package:bakery_app/features/domain/repositories/product_counting_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/product_counting_added.dart';
import '../entities/product_counting_to_add.dart';
import '../entities/product_not_added.dart';

class ProductCountingUseCase {
  final ProductCountingRepository _productCountingRepository;
  ProductCountingUseCase(this._productCountingRepository);

  Future<DataState<List<ProductCountingAddedEntity>>>
      getAddedProductsByDateAndCategoryId(DateTime date, int categoryId) async {
    return _productCountingRepository.getAddedProductsByDateAndCategoryId(
        date, categoryId);
  }

  Future<DataState<List<ProductNotAddedEntity>>>
      getNotAddedProductsByDateAndCategoryId(
          DateTime date, int categoryId) async {
    return _productCountingRepository.getNotAddedProductsByDateAndCategoryId(
        date, categoryId);
  }

  Future<DataState<String>> addProducts(
      ProductCountingToAddEntity product) async {
    return _productCountingRepository.addProduct(product);
  }

  Future<DataState<void>> deleteProductById(int id) async {
    return _productCountingRepository.deleteProductById(id);
  }

  Future<DataState<void>> updateProduct(
      ProductCountingToAddEntity product) async {
    return _productCountingRepository.updateProduct(product);
  }
}
