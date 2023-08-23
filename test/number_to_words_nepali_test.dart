import 'package:test/test.dart';
import 'package:number_to_words_nepali/number_to_words_nepali.dart';

void main() {
  group('Nepali Language', () {
    final Map<int, String> testNumbers = {
      10000: 'दस हजार',
      100001: 'एक लाख एक',
      11111111: 'एक करोड एघार लाख एघार हजार एक सय एघार',
      123456789: 'बाह्र करोड चौतीस लाख छपन्न हजार सात सय उनान्नब्बे',
      999999999999999999:
          'नौ शंख उनान्सय पद्म उनान्सय नील उनान्सय खरब उनान्सय अरब उनान्सय करोड उनान्सय लाख उनान्सय हजार नौ सय उनान्सय'
    };

    for (var testNumber in testNumbers.entries) {
      test('${testNumber.key}: ${testNumber.value}', () {
        expect(NumberToWordsNepali.convertNumberToWordsNepali(testNumber.key),
            testNumber.value);
      });
    }
  });

  group('English Language', () {
    final Map<int, String> testNumbers = {
      10000: 'ten thousand',
      100001: 'one lakh one',
      11111111: 'one crore eleven lakh eleven thousand one hundred eleven',
      123456789:
          'twelve crore thirty-four lakh fifty-six thousand seven hundred eighty-nine',
      999999999999999999:
          'nine shankh ninety-nine padma ninety-nine neel ninety-nine kharab ninety-nine arab ninety-nine crore ninety-nine lakh ninety-nine thousand nine hundred ninety-nine'
    };

    for (var testNumber in testNumbers.entries) {
      test('${testNumber.key}: ${testNumber.value}', () {
        expect(
            NumberToWordsNepali.convertNumberToWordsNepali(testNumber.key,
                language: Language.english),
            testNumber.value);
      });
    }
  });
}
