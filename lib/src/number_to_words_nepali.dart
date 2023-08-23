import 'package:number_to_words_nepali/src/constants.dart';
import 'package:number_to_words_nepali/src/language.dart';

/// A class to convert numbers to their Nepali word representations.
class NumberToWordsNepali {
  /// Static method to a number to its word representation in Nepali.
  ///
  /// Takes an [int] number as input and returns its corresponding words in Nepali.
  ///
  /// The [language] parameter specifies the language for the number-to-words conversion.
  ///
  /// If [language] is not provided, the default language is set to [Language.nepali].
  static String convertNumberToWordsNepali(int number,
      {Language language = Language.nepali}) {
    String numberInWords = '';
    String commaFormattedNumber = _formatWithComma(number);
    List<String> digitGroups = commaFormattedNumber.split(',');

    List<String> counts = language == Language.nepali
        ? Constants.countsNepali
        : Constants.countsEnglish;

    for (var i = 0; i < digitGroups.length - 1; i++) {
      String digits = digitGroups[i];
      if (digits == '00') continue;
      if (digits[0] == '0') digits = digits.substring(1);

      digits =
          '${_wordForUnitNumber(int.parse(digits), language)} ${counts[digitGroups.length - i]} ';

      numberInWords += digits;
    }

    var hundredDigits = digitGroups.last;

    if (hundredDigits.length == 3) {
      if (hundredDigits[0] != '0') {
        numberInWords +=
            '${_wordForUnitNumber(int.parse(hundredDigits[0]), language)} ${counts[1]} ';
      }
      hundredDigits = hundredDigits.substring(1);
    }

    if (hundredDigits != '00') {
      if (hundredDigits[0] == '0') hundredDigits = hundredDigits.substring(1);
      numberInWords += _wordForUnitNumber(int.parse(hundredDigits), language);
    }

    return numberInWords.trim();
  }

  /// Formats the number with commas (e.g., 1,00,00,000) for easier conversion.
  static String _formatWithComma(int number) {
    String numberString = number.toString();
    String formattedNumber = '';
    int count = 0;
    bool isThousandDone = false;

    for (int i = numberString.length - 1; i >= 0; i--) {
      if ((isThousandDone && count == 2) || (!isThousandDone && count == 3)) {
        formattedNumber = ',$formattedNumber';
        count = 0;
        isThousandDone = true;
      }
      formattedNumber = numberString[i] + formattedNumber;
      count++;
    }

    return formattedNumber;
  }

  /// Returns the word representation for a unit number in the specified language.
  static String _wordForUnitNumber(int number, Language language) {
    String numberInWords = '';

    if (language == Language.nepali) {
      numberInWords = Constants.unitsNepali[number];
    } else {
      if (number < 20) {
        numberInWords = Constants.unitsEnglish[number];
      } else if (number % 10 == 0) {
        numberInWords = Constants.tensEnglish[number % 10];
      } else {
        numberInWords = Constants.tensEnglish[(number ~/ 10).toInt()];
        numberInWords += '-';
        numberInWords += Constants.unitsEnglish[number % 10];
      }
    }

    return numberInWords;
  }
}
