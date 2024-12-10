class AddressValidator {
  static bool isValid(String address) {
    return RegExp(r'^[a-zA-Zء-ي\s]+$').hasMatch(address);
  }
  
  static String formatAddress(String address) {
    return '$address cairo egypt';
  }
}