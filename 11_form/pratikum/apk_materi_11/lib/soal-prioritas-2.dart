import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTextWidget(),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  @override
  _MyTextWidgetState createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  //variabel class _mytextwidgetstate
  String inputText1 = '';
  String inputText2 = '';
  //list menyimpan data
  List<Map<String, dynamic>> data = [
    {'Nama': 'tika', 'Nomor': '0896 5467 4563'},
    {'Nama': 'jadu', 'Nomor': '0865 5364 53643'}
  ];

  void submitForm() {
    Map<String, dynamic> newData = {
      'Nama': inputText1,
      'Nomor': inputText2,
    };

    setState(() {
      data.add(newData);
      inputText1 = '';
      inputText2 = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 18, right: 20, left: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                const Icon(
                  Icons.mobile_friendly,
                  size: 30.0,
                  color: Color.fromARGB(255, 68, 60, 60),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Create New Contacts',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 20),
                    child: Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 430,
                  color: const Color(0xFFE7E0EC),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 16.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      TextField(
                        onChanged: (nama) {
                          setState(() {
                            inputText1 = nama;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: '    Insert Your Name',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: 430,
                  color: const Color(0xFFE7E0EC),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 16.0),
                        child: Text(
                          'Number HandPhone',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      TextField(
                        onChanged: (nomor) {
                          setState(() {
                            inputText2 = nomor;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: '    +62...',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                Button(
                  onPressed: submitForm,
                ),
                const SizedBox(height: 28),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'List Contact',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 13),
                //list data contact
                ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: data.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(
                            0xFFEADDFF), // Warna latar belakang bulat
                        child: Text(
                          getFirstLetter(
                              '${data[index]['Nama']}'), // Mengambil huruf pertama dari nama
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text('${data[index]['Nama']}'),
                      subtitle: Text('${data[index]['Nomor']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //membuat icon dan proses edit data
                          //
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String editedName = data[index]['Nama'];
                                  String editedNumber = data[index]['Nomor'];

                                  return AlertDialog(
                                    title: const Text('Edit Contacts'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Name',
                                          ),
                                          onChanged: (value) {
                                            editedName = value;
                                          },
                                          controller: TextEditingController(
                                              text: editedName),
                                        ),
                                        TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Number Handphone',
                                          ),
                                          onChanged: (value) {
                                            editedNumber = value;
                                          },
                                          controller: TextEditingController(
                                              text: editedNumber),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Simpan perubahan ke data
                                          setState(() {
                                            data[index]['Nama'] = editedName;
                                            data[index]['Nomor'] = editedNumber;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          //membuat icon delete dan proses delete
                          //
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Delele Contacts'),
                                    content: const Text(
                                        'Are you sure you want to delete this contact??'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            data.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class button submit
class Button extends StatelessWidget {
  final VoidCallback
      onPressed; // Fungsi yang akan dipanggil saat tombol ditekan

  Button({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 94,
        height: 30,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF6750A4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: InkWell(
          // Gunakan InkWell untuk memberikan efek ketika tombol ditekan
          onTap: onPressed, // Panggil fungsi onPressed saat tombol ditekan
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//function mendaptkan huruf pertama untuk didalaam lingkaran
String getFirstLetter(String text) {
  return text.isNotEmpty ? text.substring(0, 1) : '';
}
