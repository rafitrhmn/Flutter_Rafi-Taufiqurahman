///soal prioritas 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///
void main(List<String> args) {
  //cosutum kan variabel berat hewan sesuka mu
  int beratHewan = 40;
  var hewan = Hewan(beratHewan);
  hewan.start();
}

class Hewan {
  int berat;
  //constraktor
  Hewan(this.berat);

  void start() {
    var mobil = Mobil(berat);
    mobil.start();
  }
}

class Mobil {
  int beratKg;
  int kapasitasMuatan = 100;
  int muatanSementara = 50;
  int totalSementara = 0;

  //constarktor
  Mobil(this.beratKg);

  void start() {
    totalSementara = beratKg + muatanSementara;
    if (totalSementara <= kapasitasMuatan) {
      kapasitasMuatan = kapasitasMuatan - totalSementara;
      print('Muatan tersedia. tersisa $kapasitasMuatan Kg muatan lagi ');
    } else {
      print('Muatan seudah penuh. Silahkan pindah ke mobil lain');
    }
  }
}
