import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/commom/extensions/sizes.dart';
import 'package:financy_app/commom/widgets/app_header.dart';
import 'package:financy_app/commom/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/commom/widgets/transacation_listview.dart';
import 'package:financy_app/features/home/home_controller.dart';
import 'package:financy_app/features/home/home_state.dart';
import 'package:financy_app/features/home/widgets/balance_card_widget.dart';
import 'package:financy_app/features/home/widgets/balance_card_widget_controller.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = locator.get<HomeController>();
  final balanceController = locator.get<BalanceCardWidgetController>();

  @override
  void initState() {
    super.initState();
    homeController.getLatestTransactions();
    balanceController.getBalances();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppHeader(),
          BalanceCard(
            controller: balanceController,
          ),
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
                      GestureDetector(
                        onTap: () {
                          homeController.pageController.jumpToPage(2);
                        },
                        child: const Text(
                          "See all",
                          style: AppTextStyles.inputLabelText,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: homeController,
                    builder: (context, _) {
                      if (homeController.state is HomeStateLoading) {
                        return const CustomCircularProgressIndicator(
                            color: AppColors.green);
                      } else if (homeController.state is HomeStateError) {
                        return Center(
                          child: Text('An error has occurred.'),
                        );
                      } else if (homeController.state is HomeStateSuccess &&
                          homeController.transactions.isNotEmpty) {
                        return TransactionListView(
                          transactionList: homeController.transactions,
                          itemCount: homeController.transactions.length >= 10 ? 10 : homeController.transactions.length,
                        );
                      }
                      return Center(
                        child: Text('There is no transactions at this time.'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
