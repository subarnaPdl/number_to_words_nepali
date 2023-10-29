import 'package:number_to_words_nepali/src/constants.dart';
import 'package:number_to_words_nepali/src/enums/enums.dart';

/// A class to convert numbers to their Nepali word representations.
class NumberToWordsNepali {
  /// Specifies the language for number to words conversion.
  final NumberToWordsLanguage language;

  /// Specifies the letter case for the converted words.
  final NumberToWordsLetterCase letterCase;

  /// Specifies whether the conversion should include monetary units (rupees and paisa).
  final bool isMonetary;

  /// Creates an instance of the [NumberToWordsNepali] class.
  ///
  /// - [language]: The target language for the conversion. Default is [NumberToWordsLanguage.nepali].
  /// - [letterCase]: The desired letter case for the converted words. Default is  [NumberToWordsLetterCase.lowerCase].
  /// - [isMonetary]: Indicates if the conversion is for monetary values. Default is `false`.
  NumberToWordsNepali({
    this.language = NumberToWordsLanguage.nepali,
    this.letterCase = NumberToWordsLetterCase.lowerCase,
    this.isMonetary = false,
  });

  /// Converts a number to its Nepali word representation.
  ///
  /// The [number] parameter can be of type int, double, or String.
  ///
  /// When passing a double number, please be aware of Dart double precision.
  /// To maintain precision, you can pass the double number as a string.
  ///
  /// The maximum length of the integral part accepted is 18 digits.
  String convertNumberToWordsNepali(Object number) {
    if (number == '') {
      throw RangeError('The number is empty. Please provide a valid number.');
    }
    if (number is! int && number is! double && number is! String) {
      throw ArgumentError('The number must be of type int, double, or string.');
    }

    number = number.toString().replaceAll(RegExp(r'^-+|,| '), '');
    if (number.isEmpty || !RegExp(r'^(?=.*\d)[\d.]+$').hasMatch(number)) {
      throw ArgumentError(
          'The number is invalid. Please provide a valid number.');
    }

    List<String> parts = number.toString().split('.');

    String integerPart = parts[0].replaceAll(RegExp(r'^0*(?!$)'), '');
    String integerWords = '';
    if (integerPart.isNotEmpty) {
      integerWords = _wordForIntegerNumber(integerPart);
    }

    String fractionalPart = parts.length == 1 ? '' : parts[1];
    if (isMonetary) {
      fractionalPart = fractionalPart.padRight(2, '0').substring(0, 2);
      fractionalPart = fractionalPart.replaceAll(RegExp(r'^0+'), '');
    } else {
      fractionalPart = fractionalPart.replaceAll(RegExp(r'0*$'), '');
    }
    String fractionalWords = '';
    if (fractionalPart.isNotEmpty) {
      if (isMonetary) {
        fractionalWords = _wordForUnitNumber(fractionalPart);
      } else {
        for (int i = 0; i < fractionalPart.length; i++) {
          fractionalWords += _wordForUnitNumber(fractionalPart[i]);
          fractionalWords += ' ';
        }
        fractionalWords = fractionalWords.trim();
      }
    }

    String numberInWords = '';

    if (isMonetary) {
      if (integerWords.isNotEmpty && integerPart != '0') {
        numberInWords += integerWords;
        numberInWords +=
            language == NumberToWordsLanguage.nepali ? ' रुपैंया' : ' rupees';
      }
      if (fractionalWords.isNotEmpty && fractionalPart != '0') {
        if (numberInWords.isNotEmpty) {
          numberInWords +=
              language == NumberToWordsLanguage.nepali ? ', ' : ' and ';
        }
        numberInWords += fractionalWords;
        numberInWords +=
            language == NumberToWordsLanguage.nepali ? ' पैसा' : ' paisa';
      }
      if (numberInWords.isEmpty) {
        numberInWords = _wordForUnitNumber('0');
        numberInWords +=
            language == NumberToWordsLanguage.nepali ? ' रुपैंया' : ' rupees';
      }
    } else {
      numberInWords = integerWords;
      if (fractionalWords.isNotEmpty) {
        numberInWords +=
            language == NumberToWordsLanguage.nepali ? ' दशमलव ' : ' point ';
        numberInWords += fractionalWords;
      }
      if (numberInWords.isEmpty) {
        numberInWords = _wordForUnitNumber('0');
      }
    }

    return _convertCase(numberInWords.trim());
  }

  /// Converts the integer part of the number to words.
  String _wordForIntegerNumber(String number) {
    if (number.length > 18) {
      throw RangeError(
          'The number is too large. Please provide a number within 18 characters.');
    }

    if (number.isEmpty) return '';
    if (number == '0') return _wordForUnitNumber('0');

    String numberInWords = '';
    String commaFormattedNumber = _formatWithComma(number);

    List<String> digitGroups = commaFormattedNumber.split(',');

    List<String> counts = language == NumberToWordsLanguage.nepali
        ? Constants.countsNepali
        : Constants.countsEnglish;

    for (var i = 0; i < digitGroups.length - 1; i++) {
      String digits = digitGroups[i];
      if (digits == '00') continue;
      if (digits[0] == '0') digits = digits.substring(1);

      digits =
          '${_wordForUnitNumber(digits)} ${counts[digitGroups.length - i]} ';

      numberInWords += digits;
    }

    var hundredDigits = digitGroups.last;

    if (hundredDigits.length == 3) {
      if (hundredDigits[0] != '0') {
        numberInWords +=
            '${_wordForUnitNumber(hundredDigits[0])} ${counts[1]} ';
      }
      hundredDigits = hundredDigits.substring(1);
    }

    if (hundredDigits != '00') {
      if (hundredDigits[0] == '0') hundredDigits = hundredDigits.substring(1);
      numberInWords += _wordForUnitNumber(hundredDigits);
    }

    return numberInWords.trim();
  }

  /// Converts the unit number to words in the specified language.
  String _wordForUnitNumber(String number) {
    int num = int.parse(number);
    String numberInWords = '';

    if (language == NumberToWordsLanguage.nepali) {
      numberInWords = Constants.unitsNepali[num];
    } else {
      if (num < 20) {
        numberInWords = Constants.unitsEnglish[num];
      } else {
        numberInWords = Constants.tensEnglish[(num ~/ 10).toInt()];
        if (num % 10 != 0) {
          numberInWords += '-';
          numberInWords += Constants.unitsEnglish[num % 10];
        }
      }
    }

    return numberInWords;
  }

  /// Formats the number with commas (e.g., 1,00,00,000) for easier conversion.
  String _formatWithComma(String number) {
    String formattedNumber = '';
    int count = 0;
    bool isThousandDone = false;

    for (int i = number.length - 1; i >= 0; i--) {
      if ((isThousandDone && count == 2) || (!isThousandDone && count == 3)) {
        formattedNumber = ',$formattedNumber';
        count = 0;
        isThousandDone = true;
      }
      formattedNumber = number[i] + formattedNumber;
      count++;
    }

    return formattedNumber;
  }

  /// Converts the letter case.
  String _convertCase(String numberInWords) {
    switch (letterCase) {
      case NumberToWordsLetterCase.lowerCase:
        return numberInWords.toLowerCase();
      case NumberToWordsLetterCase.upperCase:
        return numberInWords.toUpperCase();
      case NumberToWordsLetterCase.titleCase:
        return numberInWords.split(' ').map((word) {
          if (word.isNotEmpty) {
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          } else {
            return '';
          }
        }).join(' ');
      case NumberToWordsLetterCase.sentenceCase:
        return numberInWords.trimLeft()[0].toUpperCase() +
            numberInWords.trimLeft().substring(1).toLowerCase();
      default:
        return numberInWords;
    }
  }
}
