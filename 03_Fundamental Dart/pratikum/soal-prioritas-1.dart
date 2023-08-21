///nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
///1.membuat rumus luas dan keliling persegi
///diketahui, S (sisi) = 5 cm.

int luasPersegi(int s) {
  //function luas persegi
  return s * s;
}

int kelilingPersegi(int s) {
  return 4 * s;
}

///2.membuat rumus luas dan keliling persegi panjang
int luasPersegiPanjang(int p, int l) {
  return p * l;
}

int kelilingPersegiPanjang(int p, int l) {
  var i = p + l;
  return 2 * i;
}

void main(List<String> args) {
  int s = 5;
  var luaspersegi = luasPersegi(s); //memanggil function
  var kelilingpersegi = kelilingPersegi(s);
  print('luas persegi dengan sisi $s cm adalah $luaspersegi cm');
  print('keliling persegi dengan sisi $s cm adalah $kelilingpersegi cm \n');

  ///
  int p = 4;
  int l = 6;
  var luaspersegipanjang = luasPersegiPanjang(p, l);
  var kelilingpersegipanjang = kelilingPersegiPanjang(p, l);
  print('''
luas persegi panjang dengan panjang $p cm dan lebar $l cm adalah $luaspersegipanjang cm
keliling persegi panjang dengan panjang $p cm dan lebar $l cm adalah $kelilingpersegipanjang cm
''');
}
