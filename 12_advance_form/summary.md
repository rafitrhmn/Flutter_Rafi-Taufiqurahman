summary

Advance form input 

1.Date Picker
ialah widget memasukkan tanggal. baik tanggal kelahiran, waktu pemesanan tiket dan jadwal.
cara membuat date picker
- menambahkan packgaes intl:^0.18.0
- mempersiapkan variabel datetime dikelas stattless.
class homepage extands state<homepage>{
    datetime _duedate = DataTime.Now();
    final currentdate = DataTime.Now();
}
- membangun ui dengan widget buildDatePicker didalam body
 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Date',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: const Text(
                      'Select date',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
- menambahkan fungsi showdate picker dan fungsi setstate
Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

2. Color Picker
Widget dimana user bisa memilih color. 
cara pembuatan color picker:
- menambhakan packages flutter_colorpicker di pubspec.yaml
- mempersiapkan variabel 
Color_currentcolor = color.blue;
- membangun UI
child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 500.0,
            height: 100.0,
            color: selectedColor,
          ),
)
- meanmbahkan showdialog utk mereturn widget alertdialog
ElevatedButton(
            child: const Text('Pilih Warna'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pilih Warna'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: selectedColor,
                        onColorChanged:
                            changeColor, //memanngil method ubah color
                        colorPickerWidth: 300.0,
                        pickerAreaHeightPercent: 0.7,
                        enableAlpha: true,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

3.file picker
ialah widget yang mengakses file penyimpanan dan memilih serta membuka file.
cara membuat file picker:
- tambahakan packages file_picker dan open_file di pubspec.yaml
- membangun UI
- buat method untuk mengexplor filr dan memilih file dari stroge.
- memanggil fungsi _pickfile dalam onpressed





