import '../../../core/resources/data_state.dart';
import '../entities/stale_product.dart';
import '../entities/stale_product_added.dart';
import '../entities/stale_product_to_add.dart';
import '../repositories/stale_product_repository.dart';

class StaleProductUseCase {
  final StaleProductRepository _staleProductRepository;
  StaleProductUseCase(this._staleProductRepository);

  Future<DataState<List<StaleProductAddedEntity>>> getAddedStaleProductListByDate(
      DateTime date, int categoryId) async {
    return _staleProductRepository.getAddedStaleProductListByDate(date,categoryId);
  }

  Future<DataState<List<StaleProductEntity>>> getProductListByDate(
      DateTime date, int categoryId) async {
    return _staleProductRepository.getProductProductListByDate(date, categoryId);
  }

  Future<DataState<void>> addStaleProduct(
      StaleProductToAddEntity staleProductToAdd) async {
    return _staleProductRepository.addStaleProduct(staleProductToAdd);
  }

  Future<DataState<void>> deleteStaleProduct(int id) async {
    return _staleProductRepository.deleteStaleProduct(id);
  }

  Future<DataState<void>> updateStaleProduct(
      StaleProductToAddEntity staleProductToAdd) async {
    return _staleProductRepository.updateStaleProduct(staleProductToAdd);
  }
}