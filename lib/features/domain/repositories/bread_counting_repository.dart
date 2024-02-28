import '../../../core/resources/data_state.dart';
import '../entities/bread_counting.dart';

abstract class BreadCountingRepository{
  Future<DataState<BreadCountingEntity?>> getBreadCountingByDate(DateTime date);
  Future<DataState<void>> addBreadCounting(BreadCountingEntity breadCounting);
  Future<DataState<void>> deleteBreadCountingById(int id);
  Future<DataState<void>> updateBreadCounting(BreadCountingEntity breadCounting);
}