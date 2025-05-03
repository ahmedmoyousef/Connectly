import 'package:connectly/helper/constants.dart';
import 'package:connectly/router/app_router.dart';
import 'package:flutter/material.dart';

class MainAppDrawer extends StatelessWidget {
  const MainAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Connectly Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Application'),
            onTap: () {
              Navigator.pushNamed(context, Routes.aboutApplication);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('App Privacy'),
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.webView,
                arguments: WebViewArguments(url: Constants.privacyPolicyUrl),
              );
            },
          ),
        ],
      ),
    );
  }
}
