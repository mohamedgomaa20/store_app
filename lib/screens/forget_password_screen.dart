import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../helper/validators.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button_with_icon.dart';
import '../widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    Gap(95),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forget Password",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Gap(26),
                    Padding(
                      padding: .symmetric(horizontal: 40),
                      child: Text(
                        "Enter your email to reset your password and continue chatting",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Gap(90),
                    CustomTextFormField(
                      hintText: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                    ),
                    Gap(30),
                    CustomElevatedButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      title: "Send",
                      isLoading: isLoading,
                    ),
                    Gap(35),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
