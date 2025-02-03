import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/commom/widgets/custom_text_form_field.dart';
import 'package:financy_app/commom/widgets/password_form_field.dart';
import 'package:financy_app/commom/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../commom/widgets/multi_text_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("assets/images/sign_up_image.png"),
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "your name",
                  hintText: "Felipe Alves",
                ),
                CustomTextFormField(
                  labelText: "your email",
                  hintText: "your@email.com",
                ),
                PasswordFormField(
                  labelText: "choose your password",
                  hintText: "********",
                ),
                PasswordFormField(
                  labelText: "confirm your password",
                  hintText: "********",
                ),
              ],
            ),
          ),
          PrimayButton(
            text: "Sign Up",
            onPressed: () {},
          ),
          MultiTextButton(
            onPressed: () => {},
            children: [
              Text(
                'Already have account? ',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                'Sign In',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenTwo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


