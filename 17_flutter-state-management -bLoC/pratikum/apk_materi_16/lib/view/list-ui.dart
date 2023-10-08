import 'package:flutter/material.dart';
import '../model/data_bloc.dart'; // Pastikan Anda mengimpor DataBloc yang sesuai

class ListContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataBloc = DataBloc(); // Menggunakan DataBloc

    return Container(
      child: Column(
        children: [
          StreamBuilder<List<Map<dynamic, dynamic>>>(
            stream: dataBloc.dataStream, // Gunakan stream dari DataBloc
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final datas = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: datas.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final contact = datas[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFEADDFF),
                        child: Text(
                          gettext(
                              contact)[0], // Mengambil huruf pertama dari nama
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text(contact['Nama']),
                      subtitle: Text(contact['Nomor']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String editedName = contact['Nama'];
                                  String editedNumber = contact['Nomor'];

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
                                          dataBloc.editData(
                                            index,
                                            Data(
                                              nama: editedName,
                                              nohp: editedNumber,
                                              selectedDate: DateTime.now(),
                                              selectedColor: Colors.blue,
                                              selectedFilePath:
                                                  'Path File Baru',
                                            ),
                                          );
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
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Delete Contacts'),
                                    content: const Text(
                                        'Are you sure you want to delete this contact??'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Hapus data
                                          dataBloc.deleteData(index);
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
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Loading state or initial state
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  // Method mendapatkan key nama dari data list
  gettext(Map<dynamic, dynamic> contact) => contact['Nama'];
}
