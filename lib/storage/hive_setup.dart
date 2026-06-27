import 'package:hive_ce/hive.dart';
import '../models/phone_contact.dart';

class HiveSetup {
  static Future<void> registerAdapters() async {
    Hive.registerAdapter(PhoneContactAdapter());
  }
}
