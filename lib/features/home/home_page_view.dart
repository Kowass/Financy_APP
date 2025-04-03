import 'dart:developer';

import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/widgets/custom_bottom_app_bar.dart';
import 'package:financy_app/features/home/home_controller.dart';
import 'package:financy_app/features/home/home_page.dart';
import 'package:financy_app/features/home/widgets/balance_card_widget_controller.dart';
import 'package:financy_app/features/profile/profile_page.dart';
import 'package:financy_app/features/stats/stats_page.dart';
import 'package:financy_app/features/wallet/wallet_page.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          StatsPage(),
          WalletPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/transaction');
          if (result != null) {
            locator.get<HomeController>().getAllTransactions();
            locator.get<BalanceCardWidgetController>().getBalances();
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(children: [
        CustomBottomAppBarItem(
          label: 'home',
          primaryIcon: Icons.home,
          secondaryIcon: Icons.home_outlined,
          onPressed: () => pageController.jumpToPage(
            0,
          ),
        ),
        CustomBottomAppBarItem(
          label: 'stats',
          primaryIcon: Icons.analytics,
          secondaryIcon: Icons.analytics_outlined,
          onPressed: () => pageController.jumpToPage(
            1,
          ),
        ),
        CustomBottomAppBarItem.empty(),
        CustomBottomAppBarItem(
          label: 'wallet',
          primaryIcon: Icons.account_balance_wallet,
          secondaryIcon: Icons.account_balance_wallet_outlined,
          onPressed: () => pageController.jumpToPage(
            2,
          ),
        ),
        CustomBottomAppBarItem(
          label: 'profile',
          primaryIcon: Icons.person,
          secondaryIcon: Icons.person_outlined,
          onPressed: () => pageController.jumpToPage(
            3,
          ),
        ),
      ]),
    );
  }
}
