import 'package:bloc/bloc.dart';
import 'package:connectly/helper/phone_number_helper.dart';
import 'package:connectly/models/country.dart';
import 'package:connectly/models/valid_phone_number.dart';
import 'package:flutter/foundation.dart';
import 'phone_state.dart';

class PhoneCubit extends Cubit<PhoneState> {
  late final List<Country> countries;

  late Country country;
  PhoneCubit() : super(PhoneState(phoneCode: '', phoneNumber: null)) {
    _init();
  }

  void _init() {
    countries =
        PhoneNumberHelper.supportedRegions.values
            .map((e) => Country.fromFlutterLibCountry(e))
            .toList();
    country = countries.firstWhere(
      (element) =>
          element.countryCode == PhoneNumberHelper.currentRegion?.countryCode,
      orElse: () => Country.empty(),
    );
    emit(
      state.copyWith(
        phoneCode: country.displayCode,
        phonePlaceholder: country.exampleNumberMobileNational,
      ),
    );
  }

  Future<void> validatePhoneNumber(String phoneNumber) async {
    if (phoneNumber.length < 5) {
      emit(state.copyWith(phoneNumber: null));
      return;
    }
    try {
      final parsed = await PhoneNumberHelper.parsePhone(
        phoneNumber,
        region: country.countryCode,
      );
      debugPrint('Parsed phone number: $parsed');
      final validPhoneNumber = ValidPhoneNumber.fromJson(parsed);
      emit(state.copyWith(phoneNumber: validPhoneNumber));
    } catch (e) {
      emit(state.copyWith(phoneNumber: null));
    }
  }

  void changeCountry(Country newCountry) {
    country = newCountry;
    emit(
      state.copyWith(
        phoneCode: country.displayCode,
        phoneNumber: null,
        phonePlaceholder: country.exampleNumberMobileNational,
      ),
    );
  }
}
