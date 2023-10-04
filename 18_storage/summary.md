summary storage

storage
ialah penyimapanan data.
diperlukan efesiensi penggunaan data internet dan contohnya seperti shared preferences dan local database.

1.  shared preference
    menyimpan data yang sederhana, penyimpanan dengan format key-value, dan menyimpan data dasar sperti teks dan angka
    contoh kode :

a. masukan kode ini di pubs.yaml di depencies.
        shared_preferences: ^2.0.13
b. 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Contoh variabel yang akan disimpan di Shared Preferences
  String userName = '';

  @override
  void initState() {
    super.initState();
    // Memuat data dari Shared Preferences saat widget diinisialisasi
    loadUserName();
  }

  // Metode untuk menyimpan data ke Shared Preferences
  void saveUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', userName);
  }

  // Metode untuk memuat data dari Shared Preferences
  void loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? ''; // Mengambil data 'user_name', atau gunakan string kosong jika tidak ada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, $userName!', // Menampilkan nilai userName dari Shared Preferences
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter your name'),
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                saveUserName(); // Menyimpan userName ke Shared Preferences
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}



2  local database (SQliTE)
 ialah penyimpanan yang menyimpan dan meninta data dalam jumlah besar pada local device. bersifat privat. menggunakan SQlite database melalui package sqlflite. dan mendukung open source yang mendukung insert,read,update dan remove data.
 contoh kode local database:
 
a. tambahkan depencies di pubs.yaml
 dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.0.0
  path: ^2.1.1

b. Buat kelas model untuk entitas yang akan disimpan dalam database:
class Note {
  int? id;
  String title;
  String content;

  Note({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}

c.Buat kelas utilitas database untuk berinteraksi dengan database:
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'notes_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT
          )
          ''',
        );
      },
    );
  }

  Future<int> insert(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  Future<int> update(Note note) async {
    final db = await database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

d.Buat tampilan aplikasi Flutter untuk menambah, membaca, memperbarui, dan menghapus catatan:
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Example',
      home: NotesListScreen(),
    );
  }
}

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  final dbHelper = DatabaseHelper();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    final allNotes = await dbHelper.getAllNotes();
    setState(() {
      notes = allNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await dbHelper.delete(note.id!);
                      _loadNotes();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(labelText: 'Content'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final title = titleController.text;
                    final content = contentController.text;
                    final newNote = Note(title: title, content: content);
                    await dbHelper.insert(newNote);
                    titleController.clear();
                    contentController.clear();
                    _loadNotes();
                  },
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


