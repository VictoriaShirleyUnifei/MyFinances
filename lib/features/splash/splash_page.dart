import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_finances/common/app_colors.dart';
import 'package:my_finances/common/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.gradient, 
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Centraliza o conteúdo
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 80, 
            ),

            const SizedBox(width: 18), // Espaço entre logo e texto

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Text(
                  'My',
                  style: AppTextStyles.bigText.copyWith(
                    fontSize: 22,
                    color: AppColors.textPrimary,
                    height: 0.8,
                  ),
                ),
                Text(
                  'Finances',
                  style: AppTextStyles.bigText.copyWith(
                    color: AppColors.textTitle, // Correção aplicada aqui
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
