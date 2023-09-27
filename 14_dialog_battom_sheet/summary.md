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
     ialah memuncukan sebuah dialog dibawah layar aplikasi.
     cara menggunakan battom sheet:
     - menggunakan fungsi show modal battom sheet
     - membutuhkan properti context dan builder
       contoh kode battom sheet :
       showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  // Handle the "Share" action
                  // You can put your code here
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text('Copy Link'),
                onTap: () {
                  // Handle the "Copy Link" action
                  // You can put your code here
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
              ),

