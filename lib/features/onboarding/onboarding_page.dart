import 'package:flutter/material.dart';
import 'package:my_finances/common/constants/app_colors.dart';
import 'package:my_finances/common/constants/app_text_styles.dart';
import 'package:my_finances/common/widgets/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SizedBox(height: 60.0),
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.background,
              child: Image.asset('assets/images/onboarding.png'),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.card,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Spend Smarter\nSave More',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bigText.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: PrimaryButton(
                        text: 'Get Started',
                        onPressed: () {
                          // ação do botão
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have Account? "),
                      GestureDetector(
                        onTap: () {
                          // ação para login
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
