import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/commom/extensions/sizes.dart';
import 'package:financy_app/commom/routes/routes.dart';
import 'package:financy_app/commom/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/features/splash/splash_controller.dart';
import 'package:financy_app/features/splash/splash_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_)=> Sizes.init(context));
    
    _splashController.isUserLogged();
    _splashController.addListener((){
      if(_splashController.state is SplashStateSuccess){
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      }else{
        navigateOnboarding();
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  void navigateOnboarding() {
    Navigator.pushReplacementNamed(
      context,
      NamedRoute.initial,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "financy",
              style: AppTextStyles.bigText.copyWith(color: Colors.white),
            ),
            CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
