import 'package:flutter/material.dart';
import 'package:my_finances/common/constants/app_colors.dart';
import 'package:my_finances/common/constants/app_text_styles.dart';
import 'package:my_finances/common/widgets/primary_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:logger/logger.dart';

class CheckYourEmailPage extends StatefulWidget {
  const CheckYourEmailPage({super.key});

  @override
  CheckYourEmailPageState createState() => CheckYourEmailPageState();
}

class CheckYourEmailPageState extends State<CheckYourEmailPage> {
  final logger = Logger();

  final form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Check Your\nEmail',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bigText.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset('assets/images/check_your_email.png'),
                      const SizedBox(height: 20),

                      Text(
                        'All set! Follow the instructions on your email to reset your password. Dont forget to check the spam box!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, 
                          color: AppColors.textSecondary
                        ),
                      ),
                      const SizedBox(height: 30),

                      // BUTTON
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ReactiveFormConsumer(
                            builder: (context, form, child) {
                              return PrimaryButton(
                                text: 'Login',
                                onPressed: form.valid
                                    ? () {
                                        final value = form.value;
                                        logger.i('Form Values: $value');
                                      }
                                    : null,
                              );
                            },
                          ),
                        ),
                      ),                      
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
