import 'package:flutter/material.dart';
import 'package:my_finances/common/constants/app_colors.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Container(
        height: 330, // altura maior para ocupar bem o topo
        width: double.infinity,
        color: AppColors.primary,
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60); // início da curva
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
