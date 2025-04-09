import 'package:flutter/material.dart';
import 'package:my_finances/common/widgets/custom_input.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:my_finances/common/constants/app_colors.dart';
import 'package:my_finances/common/constants/app_text_styles.dart';
import 'package:my_finances/common/widgets/primary_button.dart';
import 'package:logger/logger.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final FormGroup form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
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
    'confirmPassword': FormControl<String>(validators: [Validators.required]),
  }, validators: [
    Validators.mustMatch('password', 'confirmPassword')
  ]);

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ReactiveForm(
        formGroup: form,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            children: [
              Text(
                'Start Saving\nYour Money!',
                textAlign: TextAlign.center,
                style: AppTextStyles.bigText.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/sign_up.png', height: 160),
              const SizedBox(height: 30),

              // NAME
              CustomReactiveTextField(
                formControlName: 'name',
                label: 'Your Name',
                validationMessages: {
                  ValidationMessage.required: (_) => 'Name is required',
                },
              ),
              const SizedBox(height: 20),

              // EMAIL
              CustomReactiveTextField(
                formControlName: 'email',
                label: 'Your Email',
                validationMessages: {
                  ValidationMessage.required: (_) => 'Email is required',
                  ValidationMessage.email: (_) => 'Invalid email',
                },
              ),
              const SizedBox(height: 20),

              // PASSWORD
              CustomReactiveTextField(
                formControlName: 'password',
                label: 'Choose Your Password',
                obscureText: true,
                validationMessages: {
                   ValidationMessage.required: (_) => 'Password is required',
                  ValidationMessage.minLength: (_) =>
                      'Min 8 characters required',
                  ValidationMessage.pattern: (_) =>
                      'Must include at least 1 capital letter and 1 number',
                },
              ),
            
              const SizedBox(height: 6),

              const Text(
                'Must have at least 8 characters, 1 capital letter and 1 number.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // CONFIRM PASSWORD
              CustomReactiveTextField(
                formControlName: 'confirmPassword',
                obscureText: true,
                label: 'Confirm Your Password',
                validationMessages: {
                  ValidationMessage.required: (_) => 'Confirm your password',
                  ValidationMessage.mustMatch: (_) => 'Passwords do not match',
                },
              ),
              const SizedBox(height: 30),

              // SIGN UP BUTTON
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
                              logger.i('Form Values: $value'); // Em vez de print
                            }
                          : null,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // LOGIN LINK
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have Account? "),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // ação para login
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
