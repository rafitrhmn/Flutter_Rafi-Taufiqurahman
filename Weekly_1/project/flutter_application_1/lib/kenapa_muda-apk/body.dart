import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BoxView());
}

class BoxView extends StatelessWidget {
  const BoxView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green.shade400,
      ),
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(20),
      height: 620, // Tambahkan padding jika diperlukan
      width: 500, // Tambahkan padding jika diperlukan
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'ES Kenapa Muda', // Tambahkan teks judul sesuai kebutuhan
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white, // Warna teks judul dalam kotak hijau
              fontSize: 24,
              fontWeight:
                  FontWeight.bold, // Ukuran teks judul dalam kotak hijau
            ),
          ),
          const SizedBox(height: 20), // Spacer antara teks judul dan gambar
          Image.asset(
            'assets/image/dogan.jpeg', // Ganti dengan path gambar Anda
            width: 170,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '''Dogan alami langsung dipetik dari sumber nya. isi dogan yang lembut dan putih siap membasahi tenggerokan kamu.
Kuyy Order sekarang :
bisa menghubungi kami melalui kotak box kami dibawah ini. 
             ''',
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class ContactUsBar extends StatefulWidget {
  @override
  _ContactUsBarState createState() => _ContactUsBarState();
}

class _ContactUsBarState extends State<ContactUsBar> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || !value.endsWith('@gmail.com')) {
      return 'Email harus berakhir dengan @gmail.com';
    }
    return null; // Email valid
  }

  void _submitForm() {
    if (validateEmail(emailController.text) == null) {
      String firstName = firstNameController.text;
      String lastName = lastNameController.text;
      String namaLengkap = firstName + lastName;
      String email = emailController.text;
      String message = messageController.text;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green.shade400,
            title: const Text(
              'Pesanan',
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Nama  : $namaLengkap',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Email : $email',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Pesan : $message',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      // Email valid, lakukan aksi yang diperlukan
    } else {
      // Tampilkan pesan kesalahan jika email tidak valid
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green.shade400,
            title: const Text(
              'Validasi Email',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Email harus berakhir dengan @gmail.com',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Untuk pemesanan bisa hubungi kami di bawah ini:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: validateEmail, // Validasi email di sini
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: messageController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Pesan',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
