import 'package:connectly/helper/phone_number_helper.dart';
import 'package:connectly/widgets/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'storage/hive_setup.dart';
import 'cubit/phone_cubit.dart';
import 'screens/home_screen.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await HiveSetup.registerAdapters();

  await PhoneNumberHelper.setup();
  runApp(const ConnectlyApp());
}

class ConnectlyApp extends StatelessWidget {
  const ConnectlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhoneCubit(),
      child: MaterialApp(
        title: 'Connectly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Privacy')),
      body: WebViewScreen(url: 'https://www.google.com/'),
    );
  }
}
