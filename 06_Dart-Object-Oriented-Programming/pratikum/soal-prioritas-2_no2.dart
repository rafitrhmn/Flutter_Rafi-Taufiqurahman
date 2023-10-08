///soal prioritas 2 nomor 2
///
//nama : Rafi Taufiqurahman
///program : Flutter kelas D (Basic)
///
import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan nama anda   = ');
  var nama = stdin.readLineSync()!;
  stdout.write('Masukkan kelas anda  = ');
  var kelas = stdin.readLineSync()!;
  var student = Student(nama, kelas);
  student.start();
}

class Student {
  String nama;
  String kelas;
  //ocnstrkaator
  Student(this.nama, this.kelas);

  void start() async {
    await waiting();
    eraser();
    print('Nama  : $nama');
    print('kelas : $kelas');
    proses();
  }

  void proses() {
    final courses = Course();
    while (true) {
      print('');
      print('Pilih tindakan:');
      print('1. Tambah course');
      print('2. Hapus course');
      print('3. Lihat course');
      print('4. Keluar');
      stdout.write('Masukkan nomor tindakan: ');
      var choice = int.tryParse(stdin.readLineSync() ?? '');

      switch (choice) {
        case 1:
          print('');
          stdout.write('Masukkan nama course: ');
          var namaCourse = stdin.readLineSync() ?? '';
          courses.addCourse(namaCourse);
          break;
        case 2:
          courses.viewCourse();
          stdout.write('Masukkan nomor Course yang ingin dihapus: ');
          var index = int.tryParse(stdin.readLineSync() ?? '');
          if (index != null) {
            courses.deleteCourse(index - 1);
          }
          break;
        case 3:
          courses.viewCourse();
          break;
        case 4:
          exit(0);
        default:
          print('Tindakan tidak valid.');
      }
    }
  }

  void addcourse() {}
}

class Course {
  // String? judul;
  // String? deskripsi;
  List<String> course = [];

  void addCourse(String namaCourses) {
    course.add(namaCourses);
    print('Course berhasil ditambahkan: $namaCourses');
  }

  void viewCourse() {
    if (course.isEmpty) {
      print('Perpustakaan kosong.');
    } else {
      for (var i = 0; i < course.length; i++) {
        print('Buku ke-${i + 1}: ${course[i]}');
      }
    }
  }

  void deleteCourse(int index) {
    if (index >= 0 && index < course.length) {
      var deletedBook = course.removeAt(index);
      print('Buku berhasil dihapus: $deletedBook');
    } else {
      print('Indeks buku tidak valid.');
    }
  }
}

void eraser() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

Future<dynamic> waiting() async => await Future.delayed(Duration(seconds: 1));
