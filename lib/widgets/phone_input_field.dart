import 'package:connectly/cubit/phone_state.dart';
import 'package:connectly/models/country.dart';
import 'package:connectly/widgets/generic_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/phone_cubit.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  PhoneInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneCubit = context.read<PhoneCubit>();
    return BlocConsumer<PhoneCubit, PhoneState>(
      listener: (context, state) {
        if (state.phoneNumber != null) {
          controller.text = state.phoneNumber!.national;
        }
      },
      builder: (context, state) {
        return TextField(
          controller: controller,
          onChanged: (value) async {
            await context.read<PhoneCubit>().validatePhoneNumber(value);
          },
          keyboardType: TextInputType.phone,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: state.phonePlaceholder ?? 'Enter phone number',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            labelText: 'Enter phone number',
            labelStyle: const TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            errorText:
                (state.phoneNumber != null || controller.text.isEmpty)
                    ? null
                    : 'Invalid phone number',
            errorStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            prefixIcon: InkWell(
              onTap: () => showCountryPicker(context, phoneCubit.countries),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  state.phoneCode,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showCountryPicker(BuildContext context, List<Country> countries) {
    final phoneCubit = context.read<PhoneCubit>();
    showDialog(
      context: context,
      builder:
          (_) => GenericPicker<Country>(
            title: 'Select Country',
            items: countries,
            onSelected: (selected) {
              phoneCubit.changeCountry(selected);
            },
          ),
    );
  }
}
