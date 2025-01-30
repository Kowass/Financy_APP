import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimayButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const PrimayButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: LinearGradient(
          colors: onPressed != null
              ? AppColors.greenGradient
              : AppColors.greyGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Align(
          child: Text(
            text,
            style: AppTextStyles.buttomText.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
