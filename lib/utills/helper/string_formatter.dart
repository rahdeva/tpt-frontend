class StringFormatter{
  static int formatCurrencyNumber(String value) {
    String cleanedValue = value.replaceAll(RegExp(r'[^\d]'), '');
    return int.parse(cleanedValue);
  }

  static int formatCurrencyNumberWithNegative(String value) {
    // Remove all non-digit characters and the optional leading "-" character
    String cleanedValue = value.replaceAll(RegExp(r'[^\d-]'), '');

    // Parse the cleaned value to an integer
    int parsedValue = int.parse(cleanedValue);

    return parsedValue;
  }
}