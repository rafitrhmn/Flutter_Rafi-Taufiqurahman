import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/data_provider.dart';

class ListContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Container(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            controller: ScrollController(),
            itemCount: dataProvider.datas.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final contact = dataProvider.datas[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFEADDFF),
                  child: Text(
                    gettext(contact)[0], // Mengambil huruf pertama dari nama
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
                                    controller:
                                        TextEditingController(text: editedName),
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
                                    dataProvider.editData(
                                      index,
                                      Data(
                                        nama: editedName,
                                        nohp: editedNumber,
                                        selectedDate: DateTime.now(),
                                        selectedColor: Colors.blue,
                                        selectedFilePath: 'Path File Baru',
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
                                    dataProvider.deleteData(index);
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
    );
  }

  //method mendapatkan key nama dari data list
  gettext(Map<dynamic, dynamic> contact) => contact['Nama'];
}
