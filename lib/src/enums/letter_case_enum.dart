/// An enumeration representing the supported letter cases for number-to-words conversion.
///
/// This enum defines the letter cases for which the NumberToWordsNepali class can convert
/// numbers to their word representations.
enum NumberToWordsLetterCase {
  /// Represents the `UPPERCASE` letter case.
  upperCase,

  /// Represents the `lowercase` letter case.
  lowerCase,

  /// Represents the `Title Case` where the first letter of each word is capitalized.
  titleCase,

  /// Represents the `Sentence case` where the first letter of the first word is capitalized,
  /// and the rest of the sentence is in lowercase.
  sentenceCase,
}
