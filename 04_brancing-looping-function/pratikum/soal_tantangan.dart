//soal tantangan no 1
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///

void main(List<String> args) {
  var angka1 = 23;
  var angka2 = 12;

  cek(angka1);
  cek(angka2);
}

void cek(int angka) {
  if (cekPrima(angka)) {
    print('angka $angka bilangan prima');
  } else {
    print('angka $angka bukan bilangan prima');
  }
}

bool cekPrima(int angka) {
  if (angka <= 1) {
    return false;
  } else if (angka == 2) {
    return true;
  } else if (angka % 2 == 0) {
    return false;
  }
  for (var i = 3; i * i <= angka; i += 2) {
    if (angka % i == 0) {
      return false;
    }
  }
  return true;
}
