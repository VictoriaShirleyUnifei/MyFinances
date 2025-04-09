import 'package:flutter/material.dart';
import 'package:my_finances/common/constants/app_colors.dart';
import 'package:my_finances/common/constants/app_text_styles.dart';
import 'package:my_finances/common/widgets/custom_input.dart';
import 'package:my_finances/common/widgets/primary_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final logger = Logger();

  final form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
        Validators.pattern(r'[A-Z]'),
        Validators.pattern(r'[0-9]'),
      ],
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
                        'Welcome Back!',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bigText.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset('assets/images/login.png'),
                      const SizedBox(height: 30),

                      // EMAIL
                      CustomReactiveTextField(
                        formControlName: 'email',
                        label: 'Your Email',
                        keyboardType: TextInputType.emailAddress,
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'Email is required',
                          ValidationMessage.email: (_) => 'Invalid email',
                        },
                      ),
                      const SizedBox(height: 20),

                      // PASSWORD
                      CustomReactiveTextField(
                        formControlName: 'password',
                        label: 'Your Password',
                        obscureText: true,
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'Password is required',
                          ValidationMessage.minLength: (_) =>
                              'Minimum 8 characters',
                          ValidationMessage.pattern: (_) =>
                              'Include at least one number and uppercase letter',
                        },
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
                                text: 'Sign Up',
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
                      const SizedBox(height: 20),

                      // SIGN UP LINK
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                // ação para registro
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
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
        ),
      ),
    );
  }
}
