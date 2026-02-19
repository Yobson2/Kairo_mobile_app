import 'package:flutter/foundation.dart';

/// Represents a supported currency.
@immutable
class Currency {
  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
    required this.flag,
    this.decimalPlaces = 2,
  });

  /// ISO 4217 code.
  final String code;

  /// Full name.
  final String name;

  /// Display symbol.
  final String symbol;

  /// Emoji flag.
  final String flag;

  /// Number of decimal places.
  final int decimalPlaces;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  int get hashCode => code.hashCode;
}

/// All supported currencies in Kairo.
class SupportedCurrencies {
  const SupportedCurrencies._();

  static const xof = Currency(
    code: 'XOF',
    name: 'CFA Franc BCEAO',
    symbol: 'CFA',
    flag: '🇸🇳',
    decimalPlaces: 0,
  );

  static const xaf = Currency(
    code: 'XAF',
    name: 'CFA Franc BEAC',
    symbol: 'FCFA',
    flag: '🇨🇲',
    decimalPlaces: 0,
  );

  static const ngn = Currency(
    code: 'NGN',
    name: 'Nigerian Naira',
    symbol: '₦',
    flag: '🇳🇬',
  );

  static const ghs = Currency(
    code: 'GHS',
    name: 'Ghanaian Cedi',
    symbol: 'GH₵',
    flag: '🇬🇭',
  );

  static const kes = Currency(
    code: 'KES',
    name: 'Kenyan Shilling',
    symbol: 'KSh',
    flag: '🇰🇪',
  );

  static const ugx = Currency(
    code: 'UGX',
    name: 'Ugandan Shilling',
    symbol: 'USh',
    flag: '🇺🇬',
    decimalPlaces: 0,
  );

  static const tzs = Currency(
    code: 'TZS',
    name: 'Tanzanian Shilling',
    symbol: 'TSh',
    flag: '🇹🇿',
    decimalPlaces: 0,
  );

  static const rwf = Currency(
    code: 'RWF',
    name: 'Rwandan Franc',
    symbol: 'RF',
    flag: '🇷🇼',
    decimalPlaces: 0,
  );

  static const zar = Currency(
    code: 'ZAR',
    name: 'South African Rand',
    symbol: 'R',
    flag: '🇿🇦',
  );

  static const etb = Currency(
    code: 'ETB',
    name: 'Ethiopian Birr',
    symbol: 'Br',
    flag: '🇪🇹',
  );

  static const egp = Currency(
    code: 'EGP',
    name: 'Egyptian Pound',
    symbol: 'E£',
    flag: '🇪🇬',
  );

  static const mad = Currency(
    code: 'MAD',
    name: 'Moroccan Dirham',
    symbol: 'MAD',
    flag: '🇲🇦',
  );

  static const usd = Currency(
    code: 'USD',
    name: 'US Dollar',
    symbol: r'$',
    flag: '🇺🇸',
  );

  static const eur = Currency(
    code: 'EUR',
    name: 'Euro',
    symbol: '€',
    flag: '🇪🇺',
  );

  /// All supported currencies.
  static const List<Currency> all = [
    xof,
    xaf,
    ngn,
    ghs,
    kes,
    ugx,
    tzs,
    rwf,
    zar,
    etb,
    egp,
    mad,
    usd,
    eur,
  ];

  /// Finds a currency by code.
  static Currency? byCode(String code) {
    try {
      return all.firstWhere((c) => c.code == code);
    } catch (_) {
      return null;
    }
  }

  /// Default currency.
  static const Currency defaultCurrency = xof;
}
