import 'package:connectly/models/valid_phone_number.dart';

class PhoneState {
  final String phoneCode;
  final ValidPhoneNumber? phoneNumber;
  final String? phonePlaceholder;

  PhoneState({
    required this.phoneCode,
    this.phoneNumber,
    this.phonePlaceholder,
  });

  factory PhoneState.initial() {
    return PhoneState(phoneCode: '', phoneNumber: null);
  }

  PhoneState copyWith({
    String? phoneCode,
    ValidPhoneNumber? phoneNumber,
    String? phonePlaceholder,
  }) {
    return PhoneState(
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber,
      phonePlaceholder: phonePlaceholder ?? this.phonePlaceholder,
    );
  }
}
