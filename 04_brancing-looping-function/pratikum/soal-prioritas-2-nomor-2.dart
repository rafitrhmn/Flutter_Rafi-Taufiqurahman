///soal prioritas 2 nomor 2
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///2. Buatlah sebuah jam pasir bintang
///
void main() {
  one();
  two();
}

void one() {
  int tinggi = 5;

  for (int i = 1; i <= tinggi; i++) {
    String spasi = ' ' * (i - 1);
    String bintang = '*' * (2 * (tinggi - i) + 1);
    print(spasi + bintang);
  }
}

void two() {
  int tinggi = 5;

  for (int i = 4; i >= 1; i--) {
    String spasi = ' ' * (i - 1);
    String bintang = '*' * (2 * (tinggi - i) + 1);
    print(spasi + bintang);
  }
}
