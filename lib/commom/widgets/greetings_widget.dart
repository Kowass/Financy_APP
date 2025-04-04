import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextScaler _textScaler = MediaQuery.of(context).size.width <= 360
      ? TextScaler.linear(0.8)
      : TextScaler.linear(1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good afternoon',
          textScaler: _textScaler,
          style: AppTextStyles.smallText.apply(color: AppColors.white),
        ),
        Text(
          'Ejelin Morgeana',
          textScaler: _textScaler,
          style: AppTextStyles.mediumText20.apply(color: AppColors.white),
        ),
      ],
    );
  }
}
