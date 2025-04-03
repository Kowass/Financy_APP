import 'dart:developer';

import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/extensions/page_controller_extensions.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Color? selectedItemColor;
  final PageController controller;
  final List<CustomBottomAppBarItem> children;
  const CustomBottomAppBar(
      {super.key,
      this.selectedItemColor,
      required this.children,
      required this.controller})
      : assert(children.length == 5, 'children.length must be 5');

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        log(widget.controller.selectedBottomAppBarItemIndex.toString());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map(
          (item) {
            bool currentItem;

            currentItem = widget.children.indexOf(item) ==
                widget.controller.selectedBottomAppBarItemIndex;
            return Builder(
              builder: (context) {
                return Expanded(
                  child: InkWell(
                    onTap: item.onPressed,
                    onTapUp: (_) {
                      widget.controller.setBottomAppBarItemIndex =
                          widget.children.indexOf(item);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Icon(
                        currentItem ? item.primaryIcon : item.secondaryIcon,
                        color: currentItem
                            ? widget.selectedItemColor
                            : AppColors.lightGrey,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}

class CustomBottomAppBarItem {
  final String? label;
  final IconData? primaryIcon;
  final IconData? secondaryIcon;
  final VoidCallback? onPressed;

  CustomBottomAppBarItem(
      {this.label, this.secondaryIcon, this.primaryIcon, this.onPressed});

  CustomBottomAppBarItem.empty(
      {this.label, this.secondaryIcon, this.primaryIcon, this.onPressed});
}
