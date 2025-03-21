import 'package:financy_app/commom/routes/routes.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStorage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nova Tela"),
            ElevatedButton(
              onPressed: () async {
                _secureStorage.deleteOne(key: "CURRENT_USER");
                Navigator.popAndPushNamed(context, NamedRoute.initial);
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
