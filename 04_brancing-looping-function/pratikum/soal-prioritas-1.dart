import 'dart:io';

///soal prioritas 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///1. Terdapat sebuah nilai:
// jika nilai > 70 akan mereturn “Nilai A”
// jika nilai > 40 akan mereturn “Nilai B”
// jika nilai > 0 akan mereturn “Nilai C”
// selain itu return teks kosong
///
void main(List<String> args) {
  stdout.write('masukkan angka anda ? ');
  var input = int.parse(stdin.readLineSync()!);

  switch (input) {
    case > 70:
      print('nilai A');
      break;
    case > 40:
      print('nilai B');
      break;
    case > 0:
      print('nilai C');
      break;
    default:
      print(' ');
  }
}
