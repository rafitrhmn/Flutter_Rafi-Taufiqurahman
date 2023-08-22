// 1. buat sebuah function yang menghitung jumlah dari pembelian buku,  pensi, dan tas
// 2. buatlah function yang menghitung diskon dari variabel total pembelian.
// 3. buatlah function yang menghitung Total pembelian setelah diskon

double no1(double buku, double pensil, double tas) => buku + pensil + tas;

double no2(double diskon, double total_buku_pensil_tas) {
  var i = diskon * total_buku_pensil_tas;
  return total_buku_pensil_tas - i;
}

double no3(double total_pembelian, double diskon) {
  var i = diskon * total_pembelian;
  return total_pembelian - i;
}

void main(List<String> args) {
  double buku = 10000;
  double pensil = 5000;
  double tas = 100000;
  double total_pembelian = 200000;
  double diskon = 0.1;
  //
  var total_buku_pensil_tas = no1(buku, pensil, tas);
  print('nomor satu = ${no1(buku, pensil, tas)}');
  print('nomor dua = ${no2(diskon, total_buku_pensil_tas)}');
  print('nomor ketiga = ${no3(total_pembelian, diskon)}');
}
