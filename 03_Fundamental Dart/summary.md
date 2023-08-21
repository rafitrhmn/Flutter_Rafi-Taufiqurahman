nama : Rafi Taufiqurahman
program : Flutter kelas D (Basic) 

summary materi fundamental dart
dart adalah bahasa pemograman yang digunakan untuk menjalankan framework flutter. dart dicipatakan oleh google utnuk menjlankan aplikasi yang berjalan di sisi client(frontend) seperti web(javascript), destkop(dart) dan mobile (dart).

program sederhana dart:
void main(){
    prinr ('hello world);
}
kode diatas menampilkan kata hello world di layar.

membuat komentar : 
///ini adalah simulasi

dengan perintah "///" atau "//". digunakan untuk membuat komentar agar kode tidak dijalankan atau sebagai catatan kode yang akan dibuat.

membuat variabel, tipe data dan kosntanta:
var  = untuk menampung data segala jenis data
string = untuk menampung data berupa teks yang diapit " "
int = untuk menmapung data berupa angka bulat
double = untuk menampung data berupa angka pecahan
bool = data berupa true atau false. (benar atau salah)
final = untuk menampung data yang tidak bisa diubah lagi
const = untuk memanpung data yang permanen tidak bisa diubah lagi

contoh:
string ucapan = 'hello world;
int angka = 89;
final kota = 'lubuk linggau';

membuat operator :
ariamtik = perhitungan matematis (+,/,-,*,%)
assingment = perhitungan dengan nilia pada variabel (=,+=,-=,*= dan lain-lain)
comparison = membnadingkan kesetaraan nilai (==, <,>,>= dan lain-lain)
logical  = opartor kondisi (&&,|| dan lain-lain)

contoh:
void main(){
    var a = 1;  //assingment
    var b =2;   //assingment
    print(a+b); //arimatik
    print (a < b) //comaprioson
    print (a || b) //logical
}

