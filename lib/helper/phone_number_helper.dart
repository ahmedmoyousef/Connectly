import 'package:device_region/device_region.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class PhoneNumberHelper {
  static late final Map<String, CountryWithPhoneCode> supportedRegions;
  static CountryWithPhoneCode? currentRegion;
  static String get displayCode =>
      ((currentRegion?.countryCode ?? '') +
          " +" +
          (currentRegion?.phoneCode ?? ''));

  static Future<void> setup() async {
    await init();
    supportedRegions = await getAllSupportedRegions();
    final deviceRegion = await _getRegionCode() ?? 'US';
    currentRegion = supportedRegions[deviceRegion.toUpperCase()];
    debugPrint(currentRegion.toString());
  }

  static Future<Map<String, dynamic>> parsePhone(
    String phone, {
    String? region,
  }) async {
    return parse(phone, region: region);
  }

  static Future<String?> _getRegionCode() async {
    return await DeviceRegion.getSIMCountryCode();
  }
}
