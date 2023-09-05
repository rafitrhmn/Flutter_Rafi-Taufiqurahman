import 'dart:io';

///soal prioritas 2 nomor 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
void main(List<String> args) {
  stdout.write('Masukkan angka pertama = ');
  var angka1 = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan angka kedua   = ');
  var angka2 = int.parse(stdin.readLineSync()!);
  print('''

Angka pertama = $angka1
Angka kedua   = $angka2

Pilihan Operator
1. Penjumlahan
2. Pengurangan
3. perkalian
4. Pembagian''');

  stdout.write('Masukkan pilihan operator anda (1-4) = ');
  int pilihan = int.parse(stdin.readLineSync()!);
  //definissikan kelas calkulator
  var calkulator = Calkulator(angka1, angka2);
  //
  if (pilihan == 1) {
    var nilai = calkulator.penjumlahan();
    print('Hasil penjumlahan = $nilai');
  } else if (pilihan == 2) {
    var nilai = calkulator.pengurangan();
    print('Hasil pengurangan = $nilai');
  } else if (pilihan == 3) {
    var nilai = calkulator.perkalian();
    print('Hasil perkalian = $nilai');
  } else if (pilihan == 4) {
    var nilai = calkulator.pembagian();
    print('Hasil pembagian = $nilai');
  } else {
    print('pilihan operator salah');
  }
}

class Calkulator {
  int? angka1;
  int? angka2;
  //constarktor
  Calkulator(this.angka1, this.angka2);

  //function
  int penjumlahan() => angka1! + angka2!;
  int pengurangan() => angka1! - angka2!;
  int perkalian() => angka1! * angka2!;
  double pembagian() => angka1! / angka2!;
}
