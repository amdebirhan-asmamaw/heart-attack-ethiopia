abstract final class Validators {
  static final _emailRegex = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');

  static bool isValidEmail(String value) => _emailRegex.hasMatch(value.trim());

  static bool hasMinLength(String value, int minLength) =>
      value.trim().length >= minLength;
}
