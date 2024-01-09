import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/domain/entities/added_dough_list_product.dart';
import 'package:bakery_app/features/domain/entities/dough_list.dart';
import 'package:bakery_app/features/domain/entities/dough_list_product.dart';
import 'package:bakery_app/features/domain/entities/dough_product.dart';
import 'package:bakery_app/features/domain/repositories/dough_repository.dart';

class DoughUseCase {
  final DoughRepository _doughRepository;

  DoughUseCase(this._doughRepository);

  Future<DataState<List<DoughListEntity>>> getDoughListsByDate(DateTime date) async {
    return await _doughRepository.getDoughListsByDate(date);
  }

  Future<DataState<List<AddedDoughListProductEntity>>> getDoughListProductsById(int listId) async {
    return await _doughRepository.getDoughListProductsByListId(listId);
  }

  Future<DataState<List<DoughProductEntity>>> getAvailableDoughProducts(int listId) async {
    return await _doughRepository.getAvailableDoughProducts(listId);
  }

  Future<DataState<String>> addDoughProducts(int userId, List<DoughListProductEntity> doughListProduct) async {
    return await _doughRepository.addDoughProducts(userId, doughListProduct);
  }

  Future<DataState<void>> deleteDoughProductById(int id) async {
    return await _doughRepository.deleteDoughProductById(id);
  }

  Future<DataState<void>> updateDoughProduct(DoughListProductEntity doughProduct) async {
    return await _doughRepository.updateDoughProduct(doughProduct);
  }
}
