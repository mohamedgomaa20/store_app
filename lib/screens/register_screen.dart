import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../helper/validators.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button_with_icon.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AbsorbPointer(
        absorbing: isLoading,
        child: Scaffold(
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
                            "Create Account",
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
                          "Create an account and start messaging anyone, anytime",
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
                      CustomTextFormField(
                        hintText: "Password",
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        validator: AppValidators.validatePassword,
                      ),
                      Gap(30),
                      CustomTextFormField(
                        hintText: "Confirm Password",
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        validator: (value) =>
                            AppValidators.validateConfirmPassword(
                              confirmValue: value,
                              passwordValue: passwordController.text,
                            ),
                      ),

                      Gap(30),
                      CustomElevatedButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        title: "Sign up",
                        isLoading: isLoading,
                      ),
                      Gap(35),
                      CustomOutlinedButton(
                        text: "Already have an account",
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),

                      Gap(35),

                      Gap(35),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                Container(color: Colors.black.withValues(alpha: 0.2)),
            ],
          ),
        ),
      ),
    );
  }
}
