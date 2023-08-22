void main() {
  String input1 = "kasur rusak";
  String input2 = "mobil balap";

  var balikKata1 = isPalindrome(input1);
  var balikKata2 = isPalindrome(input2);

  cekPalindrom(input1, balikKata1);
  cekPalindrom(input2, balikKata2);
}

//function membolikkan kata
String isPalindrome(String text) {
  text = text.toLowerCase();
  String reversedText = text.split('').reversed.join('');
  return reversedText;
}

//function cek palindrom
void cekPalindrom(String input, String balikkata) {
  if (input == balikkata) {
    print('$input adalah palindrom');
  } else {
    print('$input adalah bukan palindrom');
  }
}
