///soal prioritas 1 nomor 2
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///membuat program luas dan keliling lingkaran
///
double luasLingkaran(double nilaiPi, int jarijari) =>
    nilaiPi * jarijari * jarijari;

double kelilinglingkaran(double nilaiPi, int jarijari) =>
    nilaiPi * 2 * jarijari;

void main(List<String> args) {
  double nilaiPi = 3.14;
  int jarijari = 6;
  //
  var a = luasLingkaran(nilaiPi, jarijari);
  print('luas lingkaran dengan jari jari $jarijari cm adalah = $a cm');
  //
  var b = kelilinglingkaran(nilaiPi, jarijari);
  print('keliling lingkaran dengan jari jari $jarijari cm adalah = $b cm');
}
