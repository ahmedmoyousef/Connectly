import 'package:hive/hive.dart';

part 'phone_contact.g.dart';

@HiveType(typeId: 0)
class PhoneContact {
  @HiveField(0)
  final String phoneNumber;

  @HiveField(1)
  final bool isFavorite;

  PhoneContact({required this.phoneNumber, this.isFavorite = false});
}
