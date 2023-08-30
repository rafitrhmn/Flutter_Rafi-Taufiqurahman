//soal prioritas 2 nomor 2
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
// ///2. Buatlah sebuah program untuk menghitung rata-rata dari sekumpulan nilai. Lakukan pembulatan keatas untuk nilai hasil perhitungan rata-rata.
//Sampel Input:`[7,5,3,5,2,1]`
//Sampel Output:`4`

void main(List<String> args) {
  List<int> input = [7, 5, 3, 3, 2, 1];
  int hasil = 0;
  for (int data in input) {
    hasil += data;
  }
  var rataRata = hasil / input.length;
  int pembulatanHasil = rataRata.ceil();
  print('rata rata input = $pembulatanHasil');
}
