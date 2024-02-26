import 'package:bakery_app/features/domain/entities/stale_bread_added.dart';
import 'package:bakery_app/features/domain/entities/stale_bread_to_add.dart';

import '../../../core/resources/data_state.dart';
import '../entities/stale_bread.dart';

abstract class StaleBreadRepository{
  Future<DataState<List<StaleBreadAddedEntity>>>getAddedStaleBreadListByDate(DateTime date);
  Future<DataState<List<StaleBreadEntity>>> getBreadProductListByDate(DateTime date);
  Future<DataState<void>> addStaleBread(StaleBreadToAddEntity staleBreadToAdd);
  Future<DataState<void>> deleteStaleBread(int id);
  Future<DataState<void>> updateStaleBread(StaleBreadToAddEntity staleBreadToAdd);
}