import 'package:intl/intl.dart';

abstract final class CurrencyFormatter {
  static final _idr = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  static String rupiah(int amount) => _idr.format(amount);
}
