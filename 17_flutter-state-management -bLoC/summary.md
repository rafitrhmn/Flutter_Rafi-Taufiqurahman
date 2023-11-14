summary flutter state management bloc

flutter state management Bloc
Bloc sama seperti Provider. yamni memisahkan anatar bussiness logic dengan UI.

Cara kerja Bloc
- menerima event sebagai input
- menganalisa dan dikelola didalam Bloc
- menghasilkan state sebgai output

Steam adalah rangkaian proses secara asyncronus yang ada dibloc.

Cara menggunaka Bloc dipalikasi:
1. Install packgae Flutter_bloc dan equatable
2. membuat folder bloc. untuk menyimpan kode khusus bloc
3. buat file didalam folder bloc. dengan kode  dibawah ini:

import 'package:bloc/bloc.dart';

// terdapat 2 model event  yakni IncrementEvent(tambah angka) dan DecrementEvent (kurangi angka)

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}


// States, terdapat dua state yakni InitialCounterState (inisialisasi nilai awal ketika apliaksi dijalankan) dan  UpdatedCounterState (state yang mengambarkan perubahan nilai)

abstract class CounterState {}

class InitialCounterState extends CounterState {
  final int count;

  InitialCounterState(this.count);
}

class UpdatedCounterState extends CounterState {
  final int count;

  UpdatedCounterState(this.count);
}



// BLoc, kode logika bloc.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield UpdatedCounterState(state.count + 1);
    } else if (event is DecrementEvent) {
      yield UpdatedCounterState(state.count - 1);
    }
  }
}

4. buat di main.dart dengan kode ini:
terlihat saya menginisalisasi bloc di main.dart dengan kode ini = 
"final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);"
dan meenggunakan  kelas conter bloc untuk mengakses logikanya.



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Kalkulator BLoC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is UpdatedCounterState) {
                  return Text('Jumlah: ${state.count}');
                } else {
                  return Text('Loading...');
                }
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => counterBloc.add(IncrementEvent()),
                  child: Text('Tambah'),
                ),
                ElevatedButton(
                  onPressed: () => counterBloc.add(DecrementEvent()),
                  child: Text('Kurang'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
