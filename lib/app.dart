import 'package:financy_app/commom/routes/routes.dart';
import 'package:financy_app/features/home/home_page_view.dart';
import 'package:financy_app/features/onboarding/onboarding.dart';
import 'package:financy_app/features/profile/profile_page.dart';
import 'package:financy_app/features/sign_in/sign_in_page.dart';
import 'package:financy_app/features/sign_up/sign_up_page.dart';
import 'package:financy_app/features/splash/splash_page.dart';
import 'package:financy_app/features/stats/stats_page.dart';
import 'package:financy_app/features/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
        NamedRoute.home: (context) => const HomePageView(),
        NamedRoute.profile: (context) => const ProfilePage(),
        NamedRoute.stats: (context) => const StatsPage(),
        NamedRoute.wallet: (context) => const WalletPage(),
      },
    );
  }
}
