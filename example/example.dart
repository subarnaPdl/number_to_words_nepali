import 'package:number_to_words_nepali/number_to_words_nepali.dart';

void main() {
  //* Nepali language
  print('10000: ${NumberToWordsNepali.convertNumberToWordsNepali(10000)}');
  // 10000: दस हजार

  print('100001: ${NumberToWordsNepali.convertNumberToWordsNepali(100001)}');
  // 100001: एक लाख एक

  print(
      '11111111: ${NumberToWordsNepali.convertNumberToWordsNepali(11111111)}');
  // 11111111: एक करोड एघार लाख एघार हजार एक सय एघार

  print(
      '123456789: ${NumberToWordsNepali.convertNumberToWordsNepali(123456789)}');
  // 123456789: बाह्र करोड चौतीस लाख छपन्न हजार सात सय उनान्नब्बे

  print(
      '999999999999999999: ${NumberToWordsNepali.convertNumberToWordsNepali(999999999999999999)}');
  // 999999999999999999: नौ शंख उनान्सय पद्म उनान्सय नील उनान्सय खरब उनान्सय अरब उनान्सय करोड उनान्सय लाख उनान्सय हजार नौ सय उनान्सय

  //* English language
  print(
      '10000: ${NumberToWordsNepali.convertNumberToWordsNepali(10000, language: Language.english)}');
  // 10000: ten thousand

  print(
      '100001: ${NumberToWordsNepali.convertNumberToWordsNepali(100001, language: Language.english)}');
  // 100001: one lakh one

  print(
      '11111111: ${NumberToWordsNepali.convertNumberToWordsNepali(11111111, language: Language.english)}');
  // 11111111: one crore eleven lakh eleven thousand one hundred eleven

  print(
      '123456789: ${NumberToWordsNepali.convertNumberToWordsNepali(123456789, language: Language.english)}');
  // 123456789: twelve crore thirty-four lakh fifty-six thousand seven hundred eighty-nine

  print(
      '999999999999999999: ${NumberToWordsNepali.convertNumberToWordsNepali(999999999999999999, language: Language.english)}');
  // 999999999999999999:  nine shankh ninety-nine padma ninety-nine neel ninety-nine kharab ninety-nine arab ninety-nine crore ninety-nine lakh ninety-nine thousand nine hundred ninety-nine
}
