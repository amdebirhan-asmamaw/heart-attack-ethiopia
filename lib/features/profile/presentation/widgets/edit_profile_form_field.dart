import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileFormField extends StatelessWidget {
  const EditProfileFormField({
    super.key,
    required this.label,
    required this.placeholder,
    this.trailingIcon,
    this.keyboardType,
    this.obscureText = false,
  });

  final String label;
  final String placeholder;
  final Widget? trailingIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFEAE8E8).withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(18),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  cursorColor: const Color(0xFF420C11),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    filled: true,
                    fillColor: Colors.transparent,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000).withValues(alpha: 0.25),
                      height: 1.2,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF333333),
                  ),
                ),
              ),
              if (trailingIcon != null) trailingIcon!,
            ],
          ),
        ),
      ],
    );
  }
}
