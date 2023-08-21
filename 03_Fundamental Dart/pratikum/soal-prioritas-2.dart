///soal prioritas 1 nomor 2
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///1. Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan 3 variabel tersebut dan tampilkan pada layar.
///2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.

double volumetabung(double nilaiPi, int jarijari, int tinggi) {
  return nilaiPi * jarijari * jarijari * tinggi;
}

void main(List<String> args) {
  String a = 'hai ';
  String b = 'saya ';
  String c = 'Rafi';

  String gabung = a + b + c;
  print(gabung);
  //
  double nilaiPi = 3.14;
  int jarijari = 7;
  int tinggi = 10;
  var d = volumetabung(nilaiPi, jarijari, tinggi);
  print(
      'volume tabung dari jari-jari $jarijari cm dan tinggi $tinggi adalah = $d cm3');
}
