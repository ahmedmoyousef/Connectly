import 'package:hive_ce_flutter/hive_flutter.dart';

class RecentContactsService {
  static final _box = Hive.box<List<String>>('recent_contacts');

  static List<String> getRecentNumbers() {
    return _box.get('numbers') ?? [];
  }

  static Future<void> addPhoneNumber(String number) async {
    final current = getRecentNumbers();
    final updated =
        [
          number,
          ...current.where((n) => n != number),
        ].take(10).toList(); // Limit to 10
    await _box.put('numbers', updated);
  }
}
