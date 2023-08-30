///soal prioritas 2 nomor 3
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///3. Buatlah sebuah program untuk melakukan perhitungan bilangan faktorial secara asinkron.
//Sampel Input: `5`
//Sampel Output:`120`

void main() {
  var nilai = 5;
  print('hasil faktorial dari nilai $nilai adalah ${faktorial(nilai)}');
}

int faktorial(int nilai) {
  if (nilai == 0 || nilai == 1) {
    return 1;
  } else {
    var a = nilai * faktorial(nilai - 1);
    return a;
  }
}
