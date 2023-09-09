//summary
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)

Summary Depp dive into dart object oriented programming

materi pendalaman OOP.
berikut komponen diOOP:
1.constarktor
method yang dijalankan pertama kali saat class dipanggil
contoh kode constarktor didalam class user:
Class User{
    string nama;
    User(String Nama){
        this.nama = Nama;
    }
}

2. inheritance (pewarisan)
ialah membuat class baru dengan memanfaatkan class yang sudah ada. bertujuan agar kemampuan class yg sudah ada dapat dimiliki oleh class yang baru.
contoh kode inheritance didalam class user dan diwariskan ke class nama:
Class User{
    void hello(){
        print('hai semuanya');
    }
}

Class nama extends User{
    void hello2(){
        print('hai');
    }
}

3. method overiding
ialah menulis ulang method di class yang sudah di inheritance. bertujuan agar class memilki nama yang sama dengan proses yang berbeda.
contoh kode method overidding didalam class nama, yang sudah di inheritance kan dari kelas User:
Class User{
    void hello(){
        print('hai semuanya');
    }
}

Class nama extends User{
    @override
    void hello(){
        print('hai');
    }
}

4.interface
ialah menulis ulang semua method yang sudah di inheritance.
contoh kode interface didalam class nama, yang sudah di inheritance kan dari kelas User:
Class User{
    void hello(){
        print('hai semuanya');
    }
    void apologize(){
        print('saya minta maaf ya');
    }
}

Class nama implements User{
    @override
    void hello(){
        print('hai');
    }
    @override
     void apologize(){
        print('saya sunggu minta maaf');
    }

} 

5. abstark class
ialah class yang berisi methdod dan variabel yang digunakan. untuk mengakses method dan variabel nya menggunakan inheritance. 
contoh kode abstark pada class User:
abstrack class User{
    void hello(){
        print('hai');
    }
    void apologize(){
        print('saya sunggu minta maaf');
    }
}

class nama extends User{
    @override
    void hello(){
        print('hai semuanay');
    }
}

6.polymorphism
ialah kemampuan data berubah menjadi bentuk lain. dapat dilakukan dengan kata kunci extends atau implementes. ini terjadi saat memanggil objek nya.
contoh kode polymorphism memanngil class  :
void main(){
    User gol1 = nama();
    gol1.hello();
    gol1.apologize;
}

7. Generic
ialah memberi kemampuan agar menerima data dengan tipe yang berbeda. saat menjalankannya, harus memasukkan data sesuai tipe data nya.
contoh kode pada kelass User:
void User<T>{
    var nama;

    Nnama(T n ){
        nama = n;
    }
}

8. enkapsulasi
ialah kemampuan menyembunyikan data agar meningkatkan integritas data dan mengurang kompleksitas dan potenso bug dalam kode.
contoh kode  enkapsulasi pada class User:
void User {
    int variabelpublic;   //variabel public
    string _variabelPrivat;  //variabel privat
}



