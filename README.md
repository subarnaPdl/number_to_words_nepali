## number_to_words_nepali

A Dart library to convert numbers to their Nepali word representations.

## Getting started

In your pubspec.yaml
```yaml
dependencies:
  number_to_words_nepali: ^1.3.0
```

## Usage

```dart
import 'package:number_to_words_nepali/number_to_words_nepali.dart';

print('123456789: ${NumberToWordsNepali().convertNumberToWordsNepali(123456789)}');
// 123456789: बाह्र करोड चौँतीस लाख छपन्न हजार सात सय उनान्नब्बे

print('"1234567.89": ${NumberToWordsNepali(
  isMonetary: true,
  primaryUnit: 'रुपैंया',
  secondaryUnit: 'पैसा',
  separator: '',
).convertNumberToWordsNepali("1234567.89")}');
// "1234567.89": बाह्र लाख चौँतीस हजार पाँच सय सतसट्ठी रुपैंया, उनान्नब्बे पैसा

print('123456789: ${NumberToWordsNepali(
  language: NumberToWordsLanguage.english,
).convertNumberToWordsNepali(123456789)}');
// 123456789: twelve crore thirty-four lakh fifty-six thousand seven hundred eighty-nine

print('"1234567.89": ${NumberToWordsNepali(
  language: NumberToWordsLanguage.english,
  isMonetary: true,
  primaryUnit: 'rupees',
  secondaryUnit: 'paisa',
).convertNumberToWordsNepali("1234567.89")}');
// "1234567.89": twelve lakh thirty-four thousand five hundred sixty-seven rupees and eighty-nine paisa
```

## License
```
The 3-Clause BSD License

Copyright (c) 2023, Subarna Poudel

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS”
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
