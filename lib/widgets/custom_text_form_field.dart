 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.onChanged,
  });

  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? showPassword : false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        contentPadding: .all(20),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: AppColors.primaryColor,
                ),
              )
            : null,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.gray.withValues(alpha: 0.5),
        ),
        fillColor: AppColors.primaryColor.withValues(alpha: 0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: buildOutlineInputBorder(),
        focusedErrorBorder: buildOutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: .circular(10),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
