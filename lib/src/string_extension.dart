import 'constants/regex_constants.dart';

extension StringExtension on String {
  
}

extension StringValidatorExtension on String {
  // ignore: unnecessary_null_comparison, unnecessary_this
  bool get isNullOrEmpty => this == null || this.isEmpty;
  bool get isNotNullOrNoEmpty => !isNullOrEmpty;

  bool get isValidEmail => isNotNullOrNoEmpty
      ? RegExp(RegexConstants.instance.emailRegex).hasMatch(this!)
      : false;

  bool get isValidPassword => isNotNullOrNoEmpty
      ? RegExp(RegexConstants.instance.passwordRegex).hasMatch(this!)
      : false;

}