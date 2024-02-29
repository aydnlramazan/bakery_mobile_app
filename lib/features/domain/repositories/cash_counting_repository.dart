import '../../../core/resources/data_state.dart';
import '../entities/cash_counting.dart';

abstract class CashCountingRepository{
  Future<DataState<CashCountingEntity?>> getCashCountingByDate(DateTime date);
  Future<DataState<void>> addCashCounting(CashCountingEntity cashCounting);
  Future<DataState<void>> deleteCashCountingById(int id);
  Future<DataState<void>> updateCashCounting(CashCountingEntity cashCounting);
}