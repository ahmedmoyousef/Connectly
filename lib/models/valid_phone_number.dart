class ValidPhoneNumber {
  final String countryCode;
  final String e164;
  final String national;
  final String type;
  final String international;
  final String regionCode;
  final String nationalNumber;

  ValidPhoneNumber({
    required this.countryCode,
    required this.e164,
    required this.national,
    required this.type,
    required this.international,
    required this.regionCode,
    required this.nationalNumber,
  });

  factory ValidPhoneNumber.fromJson(Map<String, dynamic> json) {
    return ValidPhoneNumber(
      countryCode: json['country_code'] as String,
      e164: json['e164'] as String,
      national: json['national'] as String,
      type: json['type'] as String,
      international: json['international'] as String,
      regionCode: json['region_code'] as String,
      nationalNumber: json['national_number'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country_code': countryCode,
      'e164': e164,
      'national': national,
      'type': type,
      'international': international,
      'region_code': regionCode,
      'national_number': nationalNumber,
    };
  }
}
