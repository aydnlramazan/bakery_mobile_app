import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/domain/entities/added_product.dart';
import 'package:bakery_app/features/domain/entities/product.dart';
import 'package:bakery_app/features/domain/entities/product_to_add.dart';
import 'package:bakery_app/features/domain/repositories/product_repository.dart';

class ProductUseCase {
  final ProductRepository _productRepository;
  ProductUseCase(this._productRepository);

  Future<DataState<List<AddedProductEntity>>>
      getAddedProductsByDateAndCategoryId(DateTime date, int categoryId) async {
    return await _productRepository.getAddedProductsByDateAndCategoryId(
        date, categoryId);
  }

  Future<DataState<List<ProductEntity>>> getAvailableProductsByCategoryId(
      DateTime date, int categoryId) async {
    return await _productRepository.getAvailableProductsByCategoryId(
        date, categoryId);
  }

  Future<DataState<String>> addProducts(
      int userId, int categoryId, List<ProductToAddEntity> productList) async {
    return await _productRepository.addProducts(
        userId, categoryId, productList);
  }

  Future<DataState<void>> deleteProductById(int id) async {
    return await _productRepository.deleteProductById(id);
  }

  Future<DataState<void>> updateProduct(ProductToAddEntity product) async {
    return await _productRepository.updateProduct(product);
  }
}
