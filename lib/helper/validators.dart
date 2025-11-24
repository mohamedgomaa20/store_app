class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? validateConfirmPassword({
    required String? confirmValue,
    required String passwordValue,
  }) {
    if (confirmValue == null || confirmValue.isEmpty) {
      return "Please confirm your password";
    }
    if (confirmValue != passwordValue) {
      return "Passwords do not match";
    }
    return null;
  }
}
