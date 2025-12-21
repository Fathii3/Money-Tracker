import 'package:flutter/material.dart';
import '../common/color_extension.dart';

import '../common/theme_manager.dart';

class SegmentButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;
  const SegmentButton(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
        return ValueListenableBuilder<bool>(
        valueListenable: themeNotifier,
        builder: (context, isDarkMode, child) {
                                        var activeBgColor =
              isDarkMode ? TColor.gray60.withOpacity(0.2) : TColor.gray;

          var borderColor =
              isDarkMode ? TColor.border.withOpacity(0.15) : Colors.transparent;

                    var activeTextColor = TColor.white;

                    var inactiveTextColor = isDarkMode ? TColor.gray30 : TColor.gray50;

          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onPressed,
            child: Container(
              decoration: isActive
                  ? BoxDecoration(
                      border: Border.all(
                        color: borderColor,
                      ),
                      color: activeBgColor,
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: isActive ? activeTextColor : inactiveTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        });
  }
}
