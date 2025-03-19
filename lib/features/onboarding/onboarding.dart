import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/commom/routes/routes.dart';
import 'package:financy_app/commom/widgets/multi_text_button.dart';
import 'package:financy_app/commom/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.iceWhite,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image.asset("assets/images/man.png"),
              ),
            ),
          ),
          Text(
            'Spend Smarter',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            ),
          ),
          Text(
            'Save More',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              text: "Get Started",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  NamedRoute.signUp,
                );
              },
            ),
          ),
          MultiTextButton(
            onPressed: () => {
              Navigator.popAndPushNamed(context, NamedRoute.signIn)
            },
            children: [
              Text(
                'Already have account? ',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                'Log In',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenTwo,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
