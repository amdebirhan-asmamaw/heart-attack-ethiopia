import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final String? initialValue;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final bool isPasswordField;
  final TextInputType keyboardType;
  final double scale;

  const AuthTextField({
    super.key,
    required this.hintText,
    this.initialValue,
    required this.onChanged,
    this.obscureText = false,
    this.isPasswordField = false,
    this.keyboardType = TextInputType.text,
    required this.scale,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 43 * widget.scale,
      decoration: BoxDecoration(
        color: AppColors.loginGray,
        borderRadius: BorderRadius.circular(13 * widget.scale),
      ),
      padding: EdgeInsets.symmetric(horizontal: 11 * widget.scale),
      alignment: Alignment.center,
      child: TextFormField(
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        obscureText: _isObscured,
        keyboardType: widget.keyboardType,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 16 * widget.scale,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16 * widget.scale,
            fontWeight: FontWeight.w500,
            color: AppColors.textGray,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          filled: false,
          suffixIcon: widget.isPasswordField
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  child: Icon(
                    _isObscured
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20 * widget.scale,
                    color: AppColors.textGrayLight,
                  ),
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            minWidth: 20 * widget.scale,
            maxHeight: 20 * widget.scale,
          ),
        ),
      ),
    );
  }
}
