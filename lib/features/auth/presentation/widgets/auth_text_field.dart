import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    super.key,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.onToggleVisibility,
    this.errorText,
    this.autofillHints,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final String? errorText;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onSubmitted;

  static final OutlineInputBorder _baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(13),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      onFieldSubmitted: onSubmitted,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textBlack,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textBlack.withValues(alpha: 0.45),
        ),
        errorText: errorText,
        filled: true,
        fillColor: AppColors.loginGray,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: _baseBorder,
        enabledBorder: _baseBorder,
        focusedBorder: _border(color: AppColors.loginMaroon),
        errorBorder: _border(color: AppColors.error),
        focusedErrorBorder: _border(color: AppColors.error),
        suffixIcon: onToggleVisibility == null
            ? null
            : IconButton(
                onPressed: onToggleVisibility,
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.textBlack.withValues(alpha: 0.55),
                ),
              ),
      ),
    );
  }

  OutlineInputBorder _border({Color color = Colors.transparent}) {
    return _baseBorder.copyWith(borderSide: BorderSide(color: color));
  }
}
