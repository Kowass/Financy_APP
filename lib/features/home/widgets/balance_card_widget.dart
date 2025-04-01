// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/commom/extensions/sizes.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key? key,
    required this.totalAmount,
    required this.incomeAmount,
    required this.outcomeAmount,
  }) : super(key: key);

  final double totalAmount;
  final double incomeAmount;
  final double outcomeAmount;

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.of(context).size.width <= 360
        ? TextScaler.linear(0.8)
        : TextScaler.linear(1.0);
    return Positioned(
      left: 24.0,
      right: 24.0,
      top: 155.h,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 32.h,
        ),
        decoration: const BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      textScaler: textScaler,
                      style: AppTextStyles.mediumText16w600
                          .apply(color: AppColors.white),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 250.0.w),
                      child: Text(
                        '\$${totalAmount.toStringAsFixed(2)}',
                        textScaler: textScaler,
                        style: AppTextStyles.mediumText30
                            .apply(color: AppColors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => log('options'),
                  child: PopupMenuButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.more_horiz,
                      color: AppColors.white,
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        height: 24.0,
                        child: Text('item 1'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TransactionValueWidget(amount: incomeAmount),
                    TransactionValueWidget(amount: outcomeAmount),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionValueWidget extends StatelessWidget {
  const TransactionValueWidget({
    Key? key,
    required this.amount,
  }) : super(key: key);

  final double amount;

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width <= 360 ? 16.0 : 24.0;
    TextScaler textScaler = MediaQuery.of(context).size.width <= 360
        ? TextScaler.linear(0.8)
        : TextScaler.linear(1.0);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.06),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Icon(
            amount.isNegative ? Icons.arrow_downward : Icons.arrow_upward,
            color: AppColors.white,
            size: iconSize,
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount.isNegative ? 'Expenses' : 'Income',
              textScaler: textScaler,
              style:
                  AppTextStyles.mediumText16w600.apply(color: AppColors.white),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100.0.w),
              child: Text(
                '\$${amount.toStringAsFixed(2)}',
                textScaler: textScaler,
                style: AppTextStyles.mediumText20.apply(color: AppColors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
