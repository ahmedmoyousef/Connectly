import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import '../models/phone_contact.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

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
          return const Text('No favorite numbers');
        }

        final favorites =
            box.values.where((contact) => contact.isFavorite).toList();
        if (favorites.isEmpty) {
          return const Text('No favorite numbers');
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final contact = favorites[index];
            return ListTile(
              title: Text(contact.phoneNumber),
              trailing: IconButton(
                icon: const Icon(Icons.star, color: Colors.yellow),
                onPressed: () {
                  box.put(
                    contact.phoneNumber,
                    PhoneContact(
                      phoneNumber: contact.phoneNumber,
                      isFavorite: false,
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
