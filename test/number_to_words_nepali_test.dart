import 'package:test/test.dart';
import 'package:number_to_words_nepali/number_to_words_nepali.dart';

void main() {
  group('Nepali Language', () {
    final Map<dynamic, String> testNumbers = {
      10000: 'दश हजार',
      '100001': 'एक लाख एक',
      111111.11: 'एक लाख एघार हजार एक सय एघार दशमलव एक एक',
      '1234567.89': 'बाह्र लाख चौँतीस हजार पाँच सय सतसट्ठी दशमलव आठ नौ',
      999999999999999999:
          'नौ शंख उनान्सय पद्म उनान्सय नील उनान्सय खर्ब उनान्सय अर्ब उनान्सय करोड उनान्सय लाख उनान्सय हजार नौ सय उनान्सय'
    };

    for (var testNumber in testNumbers.entries) {
      test('${testNumber.key}: ${testNumber.value}', () {
        expect(NumberToWordsNepali().convertNumberToWordsNepali(testNumber.key),
            testNumber.value);
      });
    }
  });

  group('Nepali Language Monetary', () {
    final Map<dynamic, String> testNumbers = {
      10000: 'दश हजार रुपैंया',
      '100001': 'एक लाख एक रुपैंया',
      111111.11: 'एक लाख एघार हजार एक सय एघार रुपैंया, एघार पैसा',
      '1234567.89':
          'बाह्र लाख चौँतीस हजार पाँच सय सतसट्ठी रुपैंया, उनान्नब्बे पैसा',
      999999999999999999:
          'नौ शंख उनान्सय पद्म उनान्सय नील उनान्सय खर्ब उनान्सय अर्ब उनान्सय करोड उनान्सय लाख उनान्सय हजार नौ सय उनान्सय रुपैंया'
    };

    for (var testNumber in testNumbers.entries) {
      test('${testNumber.key}: ${testNumber.value}', () {
        expect(
            NumberToWordsNepali(isMonetary: true)
                .convertNumberToWordsNepali(testNumber.key),
            testNumber.value);
      });
    }
  });

  group('English Language', () {
    final Map<dynamic, String> testNumbers = {
      10000: 'ten thousand',
      '100001': 'one lakh one',
      111111.11: 'one lakh eleven thousand one hundred eleven point one one',
      '1234567.89':
          'twelve lakh thirty-four thousand five hundred sixty-seven point eight nine',
      999999999999999999:
          'nine shankh ninety-nine padma ninety-nine neel ninety-nine kharab ninety-nine arab ninety-nine crore ninety-nine lakh ninety-nine thousand nine hundred ninety-nine'
    };

    for (var testNumber in testNumbers.entries) {
      test('${testNumber.key}: ${testNumber.value}', () {
        expect(
            NumberToWordsNepali(language: NumberToWordsLanguage.english)
                .convertNumberToWordsNepali(testNumber.key),
            testNumber.value);
      });
    }
  });

  group('English Language Monetary', () {
    final Map<dynamic, String> testNumbers = {
      10000: 'ten thousand rupees',
      '100001': 'one lakh one rupees',
      111111.11:
          'one lakh eleven thousand one hundred eleven rupees and eleven paisa',
      '1234567.89':
          'twelve lakh thirty-four thousand five hundred sixty-seven rupees and eighty-nine paisa',
      999999999999999999:
          'nine shankh ninety-nine padma ninety-nine neel ninety-nine kharab ninety-nine arab ninety-nine crore ninety-nine lakh ninety-nine thousand nine hundred ninety-nine rupees'
    };

    for (var testNumber in testNumbers.entries) {
      test('${testNumber.key}: ${testNumber.value}', () {
        expect(
            NumberToWordsNepali(
                    language: NumberToWordsLanguage.english, isMonetary: true)
                .convertNumberToWordsNepali(testNumber.key),
            testNumber.value);
      });
    }
  });

  group('Error Handling', () {
    final Map<dynamic, Matcher> testNumbers = {
      '': throwsRangeError,
      '.': throwsArgumentError,
      '-.': throwsArgumentError,
      'NaN': throwsArgumentError,
      '+.12e-9': throwsArgumentError,
      '99999999999999999999999999': throwsRangeError,
      '9999999999999999999.999999999999999': throwsRangeError,
    };

    for (var testNumber in testNumbers.entries) {
      test('${testNumber.key}', () {
        expect(
            () => NumberToWordsNepali()
                .convertNumberToWordsNepali(testNumber.key),
            testNumber.value);
      });
    }
  });
}
