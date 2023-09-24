sumaary paltform widget dan layout
///
Platform Widget
terbagi menjadi 2 yakni Material App dan Cupertino App

1. Material App adalah widget dasar yang mengemas seluruh widget pada sistem android. cara menggunaaknnya dengan memanggil packagenya
(package:flutter/material.dart)
2. Cupertino App adalah widget dasar yang mengemas seluruh widget pada sistem ios. cara menggunakaknnya dengan memanggil packagenya
(package:flutter/cupertino.dart)

di dua jenis tersebut, ada scaffold dan cupertinoPageScaffold.
scaffold untuk sistem andorid dan cupertinoPageScaffold untuk sistem ios.
scaffold adalah struktur yang membentuk tata letak dsar sebuah halaman.

///Layout Flutter
ialah fitur untuk mengatur tata letak. dan layout ini berbetuk widget yang mengatur widget didalamnya.
ada 2 jenis layout yakni
1. single-child layout
-conteiner
merupakan widget yang membuat sebuah box dan memiliki margin, padding, border dan properti widget lainnya.
exp code dibody:
body: Container(
        margin: EdgeInsets.only(left: 210),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide())),
        child: Text('hai'),
      );
- center
meruapakan widget yang juga membuat box dan memiliki properti widget tinggi dan lebar serta widget yang berada diposisi tengah.
exp code dibody:
body: Center(
    chidl: text('hai'),
);
-sized box
merupakan widget yang juga membuat sebuah box tapi lebih sederhana daripada conteiner.
exp code dibody:
body: SizedBox(
    width: 29,
    height: 50,
    child: Text('hai'),
);




