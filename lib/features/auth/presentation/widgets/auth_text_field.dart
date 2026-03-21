import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.controller,
    required this.hintText,
    super.key,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.onToggleVisibility,
    this.autofillHints,
    this.onSubmitted,
    this.focusNode,
    this.autovalidateMode,
    this.textStyle,
    this.borderRadius = 13,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;

  OutlineInputBorder _baseBorder(double radius) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      textAlign: textAlign,
      onFieldSubmitted:
          onSubmitted ??
          (textInputAction == TextInputAction.next
              ? (_) => FocusScope.of(context).nextFocus()
              : null),
      textAlignVertical: TextAlignVertical.center,
      style: textStyle ??
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textHint,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textHint,
            ),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: _baseBorder(borderRadius),
        enabledBorder: _baseBorder(borderRadius),
        focusedBorder: _border(color: AppColors.textMuted, radius: borderRadius),
        errorBorder: _border(color: AppColors.error, radius: borderRadius),
        focusedErrorBorder:
            _border(color: AppColors.error, radius: borderRadius),
        suffixIcon: onToggleVisibility == null
            ? null
            : IconButton(
                onPressed: onToggleVisibility,
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.textHint,
                ),
              ),
      ),
    );
  }

  OutlineInputBorder _border({Color color = AppColors.textMuted, required double radius}) {
    return _baseBorder(radius).copyWith(borderSide: BorderSide(color: color));
  }
}
