import 'package:flutter/material.dart';

class NotificationIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool showDot;
  final Color backgroundColor;
  final Color iconColor;
  final Color dotColor;

  const NotificationIconButton({
    super.key,
    this.onTap,
    this.showDot = true,
    this.backgroundColor = const Color.fromARGB(25, 255, 255, 255), // ≈ white.withOpacity(0.1)
    this.iconColor = Colors.white,
    this.dotColor = Colors.orangeAccent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(Icons.notifications_none, color: iconColor),
            ),
            if (showDot)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
