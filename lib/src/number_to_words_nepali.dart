import 'package:number_to_words_nepali/number_to_words_nepali.dart';
import 'package:number_to_words_nepali/src/constants.dart';

class NumberToWordsNepali {
  final Language language;

  NumberToWordsNepali({
    this.language = Language.nepali,
  });

  String convertNumberToWordsNepali(int number) {
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
          '${_wordForUnitNumber(int.parse(digits))} ${counts[digitGroups.length - i]} ';

      numberInWords += digits;
    }

    var hundredDigits = digitGroups.last;

    if (hundredDigits.length == 3) {
      if (hundredDigits[0] != '0') {
        numberInWords +=
            '${_wordForUnitNumber(int.parse(hundredDigits[0]))} ${counts[1]} ';
      }
      hundredDigits = hundredDigits.substring(1);
    }

    if (hundredDigits != '00') {
      if (hundredDigits[0] == '0') hundredDigits = hundredDigits.substring(1);
      numberInWords += _wordForUnitNumber(int.parse(hundredDigits));
    }

    return numberInWords.trim();
  }

  String _formatWithComma(int number) {
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

  String _wordForUnitNumber(int number) {
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
