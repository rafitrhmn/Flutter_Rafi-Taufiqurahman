import 'dart:io';

///soal prioritas 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///

void main(List<String> args) {
  stdout.write('Masukkan Panjang  : ');
  int panjang = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan Lebar    : ');
  int lebar = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan Tinggi   : ');
  int tinggi = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan sisi     : ');
  int sisi = int.parse(stdin.readLineSync()!);
  print('');

  //
  var bangun = BangunRuang(panjang, lebar, sisi, tinggi);
  bangun.volume();
}

class BangunRuang {
  int panjang;
  int lebar;
  int tinggi;
  int sisi;

  BangunRuang(this.panjang, this.lebar, this.sisi, this.tinggi);

  void volume() {
    var kubus = Kubus(panjang, lebar, sisi, tinggi);
    var balok = Balok(panjang, lebar, sisi, tinggi);
    print('bangun Ruang');
    kubus.volume();
    balok.volume();
  }
}

class Kubus extends BangunRuang {
  // Kubus(int ) : super(panjang, lebar, tinggi, sisi);
  Kubus(int panjang, int lebar, int sisi, int tinggi)
      : super(panjang, lebar, sisi, tinggi);
  @override
  void volume() {
    int luasKubus = sisi * sisi * sisi;
    print('volume kubus adalah, $luasKubus m3');
  }
}

class Balok extends BangunRuang {
  Balok(int panjang, int lebar, int sisi, int tinggi)
      : super(panjang, lebar, sisi, tinggi);
  @override
  void volume() {
    int Volume = panjang * lebar * tinggi;
    print(
        'Volume Balok dengan panjang $panjang M, lebar $lebar M, dan Tinggi $tinggi M adalah  $Volume m3');
  }
}
