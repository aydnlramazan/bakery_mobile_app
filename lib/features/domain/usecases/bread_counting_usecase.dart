import 'package:bakery_app/features/domain/repositories/bread_counting_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/bread_counting.dart';

class BreadCountingUseCase {
  final BreadCountingRepository _breadCountingRepository;
  BreadCountingUseCase(this._breadCountingRepository);

    Future<DataState<BreadCountingEntity?>>
      getBreadCountingByDate(DateTime date) {
    return _breadCountingRepository
        .getBreadCountingByDate(date);
  }

  Future<DataState<void>> addBreadCounting(
      BreadCountingEntity breadCounting) {
    return _breadCountingRepository
        .addBreadCounting(breadCounting);
  }

  Future<DataState<void>> deleteBreadCountingById(int id) {
    return _breadCountingRepository
        .deleteBreadCountingById(id);
  }

  Future<DataState<void>> updateBreadCounting(
      BreadCountingEntity breadCounting) {
    return _breadCountingRepository
        .updateBreadCounting(breadCounting);
  }
}
