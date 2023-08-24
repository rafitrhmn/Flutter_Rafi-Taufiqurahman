///soal prioritas 2 nomor 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///1. Buatlah sebuah piramid bintang
///
void main() {
  int tinggi = 8;

  for (int i = 1; i <= tinggi; i++) {
    String spasi = ' ' * (tinggi - i);
    String bintang = '*' * (2 * i - 1);
    print(spasi + bintang);
  }
}
