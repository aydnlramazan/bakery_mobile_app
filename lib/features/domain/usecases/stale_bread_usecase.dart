import 'package:bakery_app/features/domain/repositories/stale_bread_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/stale_bread.dart';
import '../entities/stale_bread_added.dart';
import '../entities/stale_bread_to_add.dart';

class StaleBreadUseCase {
  final StaleBreadRepository _staleBreadRepository;
  StaleBreadUseCase(this._staleBreadRepository);

  Future<DataState<List<StaleBreadAddedEntity>>> getAddedStaleBreadListByDate(
      DateTime date) async {
    return _staleBreadRepository.getAddedStaleBreadListByDate(date);
  }

  Future<DataState<List<StaleBreadEntity>>> getBreadProductListByDate(
      DateTime date) async {
    return _staleBreadRepository.getBreadProductListByDate(date);
  }

  Future<DataState<void>> addStaleBread(
      StaleBreadToAddEntity staleBreadToAdd) async {
    return _staleBreadRepository.addStaleBread(staleBreadToAdd);
  }

  Future<DataState<void>> deleteStaleBread(int id) async {
    return _staleBreadRepository.deleteStaleBread(id);
  }

  Future<DataState<void>> updateStaleBread(
      StaleBreadToAddEntity staleBreadToAdd) async {
    return _staleBreadRepository.updateStaleBread(staleBreadToAdd);
  }
}
