///soal eksplorasi nomor 2
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///faktor dari angka 24
///
void main() {
  int inputan = 24;
  print("Faktor dari $inputan adalah = ${faktorBilangan(inputan)}");
}

List<int> faktorBilangan(int inputan) {
  List<int> faktor = [];

  for (int i = 1; i <= inputan; i++) {
    if (inputan % i == 0) {
      faktor.add(i);
    }
  }

  return faktor;
}
