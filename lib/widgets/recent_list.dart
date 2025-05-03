import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/phone_contact.dart';

class RecentList extends StatelessWidget {
  const RecentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<PhoneContact>>(
      future: Hive.openBox<PhoneContact>('recent_numbers'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final box = snapshot.data;
        if (box == null || box.isEmpty) {
          return const Text('No recent numbers');
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: box.length,
          itemBuilder: (context, index) {
            final contact = box.getAt(index);
            return ListTile(
              title: Text(contact?.phoneNumber ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {
                  box.putAt(
                    index,
                    PhoneContact(
                      phoneNumber: contact!.phoneNumber,
                      isFavorite: !contact.isFavorite,
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
