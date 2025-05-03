import 'package:connectly/widgets/generic_picker.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class Country implements SelectableItem {
  final String phoneCode; // '44',
  final String countryCode; // 'GB',
  final String exampleNumberMobileNational; // '07400 123456',
  final String exampleNumberFixedLineNational; // '0121 234 5678',
  final String phoneMaskMobileNational; // '00000 000000',
  final String phoneMaskFixedLineNational; // '0000 000 0000',
  final String exampleNumberMobileInternational; // '+44 7400 123456',
  final String exampleNumberFixedLineInternational; // '+44 121 234 5678',
  final String phoneMaskMobileInternational; // '+00 0000 000000',
  final String phoneMaskFixedLineInternational; // '+00 000 000 0000',
  final String? countryName; // 'United Kingdom';
  String get displayCode => (countryCode + " +" + phoneCode);
  String get displayedName => countryName ?? displayCode;
  Country({
    required this.phoneCode,
    required this.countryCode,
    required this.exampleNumberMobileNational,
    required this.exampleNumberFixedLineNational,
    required this.phoneMaskMobileNational,
    required this.phoneMaskFixedLineNational,
    required this.exampleNumberMobileInternational,
    required this.exampleNumberFixedLineInternational,
    required this.phoneMaskMobileInternational,
    required this.phoneMaskFixedLineInternational,
    required this.countryName,
  });

  factory Country.fromFlutterLibCountry(CountryWithPhoneCode country) {
    return Country(
      phoneCode: country.phoneCode,
      countryCode: country.countryCode,
      exampleNumberMobileNational: country.exampleNumberMobileNational,
      exampleNumberFixedLineNational: country.exampleNumberFixedLineNational,
      phoneMaskMobileNational: country.phoneMaskMobileNational,
      phoneMaskFixedLineNational: country.phoneMaskFixedLineNational,
      exampleNumberMobileInternational:
          country.exampleNumberMobileInternational,
      exampleNumberFixedLineInternational:
          country.exampleNumberFixedLineInternational,
      phoneMaskMobileInternational: country.phoneMaskMobileInternational,
      phoneMaskFixedLineInternational: country.phoneMaskFixedLineInternational,
      countryName: country.countryName,
    );
  }
  factory Country.empty() {
    return Country(
      phoneCode: '',
      countryCode: '',
      exampleNumberMobileNational: '',
      exampleNumberFixedLineNational: '',
      phoneMaskMobileNational: '',
      phoneMaskFixedLineNational: '',
      exampleNumberMobileInternational: '',
      exampleNumberFixedLineInternational: '',
      phoneMaskMobileInternational: '',
      phoneMaskFixedLineInternational: '',
      countryName: null,
    );
  }
}
