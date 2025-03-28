import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/widgets/primary_button.dart';
import 'package:flutter/material.dart';

Future<void> customModalBottomSheet({required context, required String content, required String buttonText}) {
    return showModalBottomSheet<void>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38.0),
            topRight: Radius.circular(38.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: AppColors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(content),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: PrimaryButton(
                      text: buttonText,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }