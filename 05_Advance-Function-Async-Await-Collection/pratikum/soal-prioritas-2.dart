///soal prioritas 2 nomor 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
//Buatlah sebuah list dengan spesifikasi berikut:
// 1. Tiap elemen wajib berupa list juga
// 2. tiap element wajib terdapat 2 data(sub-elemen)
// 3. Buatlah sebuah map dengan menggunakan list tersebut

void main(List<String> args) {
  List<Map<String, dynamic>> data = [
    {
      'nama': 'rafi',
      'nim': 2102020123,
      'asal kampus': 'universitas bina insan',
      'tempat tinggal': 'Kota LubukLinggau Sumsel'
    },
    {
      'nama': 'gilang',
      'nim': 2102020124,
      'asal kampus': 'universitas sriwijaya',
      'tempat tinggal': 'Kota Palembang Sumsel'
    },
    {
      'nama': 'juri irdiansyah',
      'nim': 2102020125,
      'asal kampus': 'universitas terbuka',
      'tempat tinggal': 'Kota Lahat Sumsel'
    }
  ];
  for (var data2 in data) {
    print('-' * 50);
    print('nama             : ${data2['nama'].toString().padRight(10)}');
    print('nim              : ${data2['nim'].toString().padRight(10)}');
    print('asal kampus      : ${data2['asal kampus'].toString().padRight(10)}');
    print(
        'tempat tinggal   : ${data2['tempat tinggal'].toString().padRight(10)}');
  }
  print('-' * 50);
}
