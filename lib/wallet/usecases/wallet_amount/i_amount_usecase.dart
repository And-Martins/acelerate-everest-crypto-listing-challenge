import 'package:decimal/decimal.dart';

abstract class IAmountUsecase {
  Future<Decimal> execute(List<double> userAmountsCripto);
}
