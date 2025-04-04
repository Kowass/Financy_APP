import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  const BasePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30.0),
          right: Radius.circular(30.0),
        ),
      ),
      child: child,
    );
  }
}
