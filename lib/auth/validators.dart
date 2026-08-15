import 'package:rewo/rewo.dart';

/// Validates signup email + password strength.
void validateSignupCredentials(String email, String password) {
  Validator.validateOrThrow(
    {'email': email, 'password': password},
    {
      'email': const ValidateRule.email(),
      'password': const ValidateRule.required(),
    },
  );

  final passwordError = _passwordStrengthError(password);
  if (passwordError != null) {
    throw ValidationException({'password': passwordError});
  }
}

/// Validates signin email + non-empty password.
void validateSigninCredentials(String email, String password) {
  Validator.validateOrThrow(
    {'email': email, 'password': password},
    {
      'email': const ValidateRule.email(),
      'password': const ValidateRule.required(),
    },
  );
}

String? _passwordStrengthError(String password) {
  final missing = <String>[];

  if (password.length < 8) {
    missing.add('at least 8 characters');
  }
  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    missing.add('one uppercase letter');
  }
  if (!RegExp(r'[a-z]').hasMatch(password)) {
    missing.add('one lowercase letter');
  }
  if (!RegExp(r'\d').hasMatch(password)) {
    missing.add('one number');
  }
  if (!RegExp(r'[^A-Za-z0-9]').hasMatch(password)) {
    missing.add('one special character');
  }

  if (missing.isEmpty) return null;
  return 'Password must include ${missing.join(', ')}';
}
