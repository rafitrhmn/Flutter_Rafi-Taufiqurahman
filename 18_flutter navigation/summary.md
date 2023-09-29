summary flutter navigation

Fultter Navigation
ialah berpindah dari halaman satu kehalaman lain. menggunakan widget Navgator.push() dan kembali kelahamn sebelumnya menggunakan Navigator.pop().
contoh kode: 

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the Second Screen
            Navigator.of(context).push(    ///kode kehalaman baru ketika tombol ditekan 
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the Home Screen
            Navigator.of(context).pop();   //kode kehalaman sebelumnya ketika tombol drawer ditekan.
          },
          child: Text('Go Back to Home Screen'),
        ),
      ),
    );
  }
}

///
Navigation dengan named routes.
berpindah ke halaman baru dengan nama alamat (route). menggunakan widget Navigator.pushNamed() dan kembali ke halamn sebelumnya menggunakan Navigator.pop().
contoh kode:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    ///menggunakan named routes 
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // menavigasi ke halaman baru dengan nama routes
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // kode ke halaman sebelumnya
            Navigator.pop(context);
          },
          child: Text('Go Back to Home Screen'),
        ),
      ),
    );
  }
}

