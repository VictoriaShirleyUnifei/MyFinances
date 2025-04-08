import 'package:flutter/material.dart';
import 'package:my_finances/common/constants/app_colors.dart';
import 'package:my_finances/common/widgets/custom_background.dart';
import 'package:my_finances/common/widgets/custom_input.dart';
import 'package:my_finances/common/widgets/notification_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'name': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
    });

    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          SafeArea(
            child: ReactiveForm(
              formGroup: form,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(width: 30),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  NotificationIconButton(),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 160,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: AssetImage('assets/images/avatar.png'),
                                  backgroundColor: AppColors.card,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Enjelin Morgeana',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'enjelinmorgeana@email.com',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Campo de nome
                      CustomReactiveTextField(
                        formControlName: 'name',
                        label: 'New Name',
                        validationMessages: {
                          ValidationMessage.required: (_) => 'Name is required',
                        },
                      ),

                      const SizedBox(height: 20),

                      // Botões de ação
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            child: const Text('CANCEL'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (form.valid) {
                               
                                // lógica de salvar aqui
                              } else {
                                form.markAllAsTouched();
                              }
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            child: const Text('SAVE'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
