import 'dart:developer';

import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/commom/extensions/sizes.dart';
import 'package:financy_app/commom/widgets/app_header.dart';
import 'package:financy_app/commom/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/commom/widgets/transacation_listview.dart';
import 'package:financy_app/features/home/home_controller.dart';
import 'package:financy_app/features/home/home_state.dart';
import 'package:financy_app/features/home/widgets/balance_card_widget.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final controller = locator.get<HomeController>();

  @override
  void initState() {
    super.initState();

    controller.getAllTransaction();
    log('Width: ${Sizes().width}, Height: ${Sizes().height}'); // Verificação de valores
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppHeader(),
          BalanceCard(totalAmount: 123123.0, incomeAmount: 123.0, outcomeAmount: -122.0,),
          Positioned(
            top: 387.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transation History',
                        style: AppTextStyles.mediumText18,
                      ),
                      const Text(
                        "See all",
                        style: AppTextStyles.inputLabelText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        if (controller.state is HomeStateLoading) {
                          return const CustomCircularProgressIndicator(
                              color: AppColors.green);
                        } else if (controller.state is HomeStateError) {
                          return Center(
                            child: Text('An error has occurred.'),
                          );
                        }
                        if (controller.transactions.isEmpty) {
                          return Center(
                            child:
                                Text('There is no transactions at this time.'),
                          );
                        }
                        return TransactionListView(
                          transactionList: controller.transactions,
                          itemCount: controller.transactions.length,
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

