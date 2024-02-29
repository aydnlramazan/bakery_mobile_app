import '../../../core/resources/data_state.dart';
import '../entities/cash_counting.dart';
import '../repositories/cash_counting_repository.dart';

class CashCountingUseCase {
  final CashCountingRepository _cashCountingRepository;
  CashCountingUseCase(this._cashCountingRepository);

  Future<DataState<CashCountingEntity?>> getCashCountingByDate(
      DateTime date) async {
    return _cashCountingRepository.getCashCountingByDate(date);
  }

  Future<DataState<void>> addCashCounting(
      CashCountingEntity cashCounting) async {
    return _cashCountingRepository.addCashCounting(cashCounting);
  }

  Future<DataState<void>> deleteCashCountingById(int id) async {
    return _cashCountingRepository.deleteCashCountingById(id);
  }

  Future<DataState<void>> updateCashCounting(
      CashCountingEntity cashCounting) async {
    return _cashCountingRepository.updateCashCounting(cashCounting);
  }
}
