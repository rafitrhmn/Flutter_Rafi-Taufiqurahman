///soal prioritas 2 tugas function
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
// Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran.
// kemudian function lingkaran tersebut dijalankan pada function main!

double luasLingakaran({int? jariJari}) {
  var nilaiPi = 3.14;
  return nilaiPi * jariJari! * jariJari;
}

void main(List<String> args) {
  var nilaiJariJari = 6;
  var luasLingkaran2 = luasLingakaran(jariJari: nilaiJariJari);
  print(
      'luas lingkaran dengan jari-jari $nilaiJariJari adalah $luasLingkaran2');
}
