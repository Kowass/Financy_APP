import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Color? selectedItemColor;
  final List<CustomBottomAppBarItem> children;
  const CustomBottomAppBar(
      {Key? key, this.selectedItemColor, required this.children})
      : assert(children.length == 5, 'children.length must be 5'),
        super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children
            .map(
              (item) {
                final currentItem = widget.children.indexOf(item) == _selectedItemIndex;
                return Expanded(child: Text('data'));
              },
            )
            .toList(),
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
