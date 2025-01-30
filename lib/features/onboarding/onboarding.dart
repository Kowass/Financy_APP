import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/commom/widgets/primaryButton.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
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
              color: AppColors.greenLightMoreDark,
            ),
          ),
          Text(
            'Save More',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightMoreDark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimayButton(
              text: "Get Started",
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have account?',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.grey,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Log In',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.greenLightMoreDark,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
