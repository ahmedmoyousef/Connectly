import 'package:connectly/cubit/phone_state.dart';
import 'package:connectly/screens/main_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/phone_cubit.dart';
import '../widgets/phone_input_field.dart';
import '../widgets/action_buttons.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connectly')),
      drawer: MainAppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PhoneInputField(),
            const SizedBox(height: 16),
            BlocBuilder<PhoneCubit, PhoneState>(
              builder: (context, state) {
                return ActionButtons(phoneNumber: state.phoneNumber);
              },
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: const [
            //         Text(
            //           'Favorites',
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         FavoriteList(),
            //         SizedBox(height: 16),
            //         Text(
            //           'Recent Numbers',
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         RecentList(),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
