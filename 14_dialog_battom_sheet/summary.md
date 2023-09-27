summary dialog button.

Dialog Button Sheet
diawali dengan melajutkan pembuatan aplikasi task management.
lalu, mempelajari alert dialog dan battom sheet.
1. alert dialog
ialah kotaak box yang menginformasikan situasi tertentu.
cara menggunakan alert dialog:
- memanggil fungsi alert dialog didalam fungsi onpressed pada icon button
- membuat properti diclass seperti content dan actions
   contoh kode:
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('This is a simple alert dialog.'),
          actions: [
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  2. battom sheet
     ialah memuncukan sebuah dialog

