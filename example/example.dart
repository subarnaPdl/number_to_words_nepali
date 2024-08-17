import 'package:number_to_words_nepali/number_to_words_nepali.dart';

void main() {
  //
  //* Nepali language *//
  //
  print('10000: ${NumberToWordsNepali().convertNumberToWordsNepali(10000)}');
  // 10000: दश हजार

  print(
      '"100001": ${NumberToWordsNepali().convertNumberToWordsNepali("100001")}');
  // "100001": एक लाख एक

  print(
      '111111.11: ${NumberToWordsNepali().convertNumberToWordsNepali(111111.11)}');
  // 111111.11: एक लाख एघार हजार एक सय एघार दशमलव एक एक

  //
  //* Nepali language monetary *//
  //
  print('1000: ${NumberToWordsNepali(
    isMonetary: true,
  ).convertNumberToWordsNepali(1000)}');
  // 1000: एक हजार रुपैंया

  print('"1234567.89": ${NumberToWordsNepali(
    isMonetary: true,
    primaryUnit: 'रुपैंया',
    secondaryUnit: 'पैसा',
    separator: '',
  ).convertNumberToWordsNepali("1234567.89")}');
  // "1234567.89": बाह्र लाख चौँतीस हजार पाँच सय सतसट्ठी रुपैंया, उनान्नब्बे पैसा

  //
  //* English language *//
  //
  print('10000: ${NumberToWordsNepali(
    language: NumberToWordsLanguage.english,
  ).convertNumberToWordsNepali(10000)}');
  // 10000: ten thousand

  print('"100001": ${NumberToWordsNepali(
    language: NumberToWordsLanguage.english,
    letterCase: NumberToWordsLetterCase.titleCase,
  ).convertNumberToWordsNepali("100001")}');
  // "100001": One Lakh One

  print('111111.11: ${NumberToWordsNepali(
    language: NumberToWordsLanguage.english,
    letterCase: NumberToWordsLetterCase.sentenceCase,
  ).convertNumberToWordsNepali(111111.11)}');
  // 111111.11: One lakh eleven thousand one hundred eleven point one one

  //
  //* English language monetary *//
  //
  print('1000: ${NumberToWordsNepali(
    language: NumberToWordsLanguage.english,
    isMonetary: true,
    letterCase: NumberToWordsLetterCase.upperCase,
  ).convertNumberToWordsNepali(1000)}');
  // 1000: ONE THOUSAND RUPEES

  print('"1234567.89": ${NumberToWordsNepali(
    language: NumberToWordsLanguage.english,
    isMonetary: true,
    primaryUnit: 'rupees',
    secondaryUnit: 'paisa',
  ).convertNumberToWordsNepali("1234567.89")}');
  // "1234567.89": twelve lakh thirty-four thousand five hundred sixty-seven rupees and eighty-nine paisa
}
