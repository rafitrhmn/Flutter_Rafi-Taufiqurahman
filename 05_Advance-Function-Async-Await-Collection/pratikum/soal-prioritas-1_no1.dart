///soal prioritas 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
//Buatlah sebuah fungsi dengan spesifikasi berikut:
//  1. Menerima 2 parameter, yaitu list data dan pengali
//  2. Lakukan perulangan pada list data secara asynchronous
//  3. Tiap perulangan, kalikan elemen list data dengan pengali
//  4. Return list baru yang berisi hasil proses diatas\

List<int> proses(List data, List penggali) {
  List<int> hasil = [];
  for (int i = 0; i < data.length; i++) {
    hasil.add(data[i] * penggali[i]);
  }
  return hasil;
}

//berhenti selama 3 detik
Future<dynamic> waiting() async => await Future.delayed(Duration(seconds: 2));

void main(List<String> args) async {
  List<int> data = [1, 2, 3, 4, 5];
  List<int> penggali = [5, 4, 3, 2, 1];

  var a = proses(data, penggali);
  // await waiting();
  print('hasil perkalian antara data dan pengali:');
  for (int i = 0; i < data.length; i++) {
    //saat iterasi ke 3 akan berhenti 2 detik
    if (i == 2) {
      await waiting();
      print('${data[i]} X ${penggali[i]} = ${a[i]}');
    } else {
      print('${data[i]} X ${penggali[i]} = ${a[i]}');
    }
  }
}
