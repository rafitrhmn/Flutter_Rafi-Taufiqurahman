///soal prioritas 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
// void main(List<String> args) {}

// abstract class KelipatanPersekutuanTerkecil {
//   int x1 = 2;
//   int y1 = 2;
// }

// abstract class FaktorPersekutuanBesar {
//   int x2 = 4;
//   int y2 = 4;
// }

// class j implements KelipatanPersekutuanTerkecil, FaktorPersekutuanBesar {
//   @override
//   int x1 = 2;
//   //
//   void hasil() {}
// }

abstract class KelipatanPersekutuanTerkecil {
  int x1;
  int y1;

  KelipatanPersekutuanTerkecil(this.x1, this.y1);
}

abstract class FaktorPersekutuanBesar {
  int x2;
  int y2;

  FaktorPersekutuanBesar(this.x2, this.y2);
}

// Implementasikan keduanya dalam satu kelas
class Matematika
    implements KelipatanPersekutuanTerkecil, FaktorPersekutuanBesar {
  @override
  int x1;
  @override
  int y1;
  @override
  int x2;
  @override
  int y2;

  Matematika(this.x1, this.y1, this.x2, this.y2);

  String hasil() {
    var penjumlahan = x1 + x2 + y1 + y2;
    // print('Hasil penjumlahan = $penjumlahan');
    return 'Hasil penjumlahan = $penjumlahan';
  }
}

void main(List<String> args) {
  var operation = Matematika(2, 2, 4, 4);
  print(operation.hasil());
}
