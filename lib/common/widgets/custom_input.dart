import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:my_finances/common/constants/app_colors.dart';

class CustomReactiveTextField extends StatefulWidget {
  final String formControlName;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Map<String, String Function(Object)>? validationMessages;

  const CustomReactiveTextField({
    super.key,
    required this.formControlName,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validationMessages,
  });

  @override
  State<CustomReactiveTextField> createState() => _CustomReactiveTextFieldState();
}

class _CustomReactiveTextFieldState extends State<CustomReactiveTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: widget.formControlName,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validationMessages: widget.validationMessages,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: AppColors.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary,
                ),
                onPressed: toggleObscureText,
              )
            : null,
      ),
    );
  }
}
