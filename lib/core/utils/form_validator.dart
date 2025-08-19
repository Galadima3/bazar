class FormValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  // Updated validatePassword method
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    // Individual checks for displaying in UI
    final hasMinLength = value.length >= 8;
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);
    final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value);

    if (!hasMinLength) {
      return 'Minimum 8 characters';
    }
    if (!hasNumber) {
      return 'At least 1 number (1-9)';
    }
    if (!hasLetters) {
      return 'At least lowercase or uppercase letters';
    }

    return null; // Password is valid
  }

  static String? validateConfirmPassword(String? value, String originalPassword) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid phone number';
    }

    return null;
  }
}