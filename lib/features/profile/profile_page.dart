import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/locator.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile'),
            TextButton(
              onPressed: () async {
                await locator.get<AuthService>().signOut();
                await const SecureStorage().deleteAll();
                if (mounted) {
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                }
              },
              child: Text("Logout", style: TextStyle(color: AppColors.antiFlashWhite ,backgroundColor: AppColors.darkGreen),),
            ),
          ],
        ),
      ),
    );
  }
}
