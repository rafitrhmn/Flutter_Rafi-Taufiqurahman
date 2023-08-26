nama : Rafi Taufiqurahman
program : Flutter kelas D (Basic)

summary materi 4 brancing looping dan function

1. pengambilan keputusan.
alur logika pemograman untuk mengambil sebuah pilihan. menggunakan "if-else" atau "switch case" atau "if-else if- else".
contoh kode:
void main(){
    int nilai = 5;
    if (nilai == 5){
        print('benar ini nilai 5');
    }else if (nilai >5){
        print('nilai diatas angak diatas 5);
    }else{
        print('bukan angka 5');
    }
}

2. looping(perulangan).
adalah logika pemograman yang dijalankan beberapa kali sampai selesai.
pertama, perulangan for. perulangan ini memerlukan nilai awal,pengubah nilai dan kondisi.
for (nilai_awal; kondisi ; pengubah nilai awal){
    //block perulangan
}

kedua, perulangan while. perulangan ini hanya memerlukan kondisi. jika kodndisi tercapai maka perulangan akan berhenti.
whiel(kondisi){
    //block perulanagan
}

ketiga, perulangan do while. perulanagan yang melakukan pengecakan perulangan terlebih dahulu setelah itu baru dicek. jika kondisi false maka perulangan berhenti dan jika kondis true perulangan akan berlanjut.
do{
 //block perulangan
}while(kondisi){
}

3.break dan continue. adalaha perintah untuk menghentikan perulangan.
perbedan antara keduanya. jika break, maka mengehentikan seluruh proses perulangan dan jika continue, maka hanya berhenti satu kali dakn lanjut preoses perulangan.

contoh break:
for(var i = 1; i < 10; i ++){
    if (i == 5){
        break;
    }
    print(i);
}
hasilanya program diatas 1,2,3,4. karena jika perulangan telah menyentuh angka 5. akan berheti.

contoh continue:
for(var i = 1; i < 10; i ++){
    if (i == 5){
        continue;
    }
    print(i);
}
hasil program diatas 1,2,3,4,6,7,8,9. angak 5 tidak muncul karena angka 5 diberhentikan oleh perintah continue.

4. function
ialah kumpulan perintah yang dapat digunakan berulang kali. untuk menggunakan nya hanya panggil nama nya saja.
contoh kode:
void ucapan(){
    print('hai');
}
function bernama ucapan dapat digunakan beberapak kali ketika kita memanggilnya.

