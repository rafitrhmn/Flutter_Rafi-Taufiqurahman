summary materi 11

Flutter Form
1. Form 
ialah widget menerima isian data dari user.
cara membuat form:
membuat kelas stateful widget dan disimpan menggunakan globalkey<form state>

2. Input (textfield)
ialah box inputan menerima isi data dari user.
cara membuat text field :
didalam body scallfold panggil widget textfield dan memasukkan properti controller.

body: Textfield{
    controller:  TexteditingControllder()
}

3. radio button
ialah button yang memberikan opsi pada pengguna dan hanya dapat memilih satu opsi.
Cara membuat Radio Button:
menggunakan widget radio dan masukkan properti value, onchannged dan group value.
Radio<String>{
    value: 'Laki-Laki',
    groupValue: radiovalue,
    onChanged: (String> value){
        setState(){
            radioValue = value ?? '';
        }
    }
}

4. chechkbox 
ialah widget yang memberi opsi pada pengguna yang dapat memilih beberapa opsi.
Cara membuat checkbox:
menggunakan widget checkbox.
Checkbox{
    value: 'Laki-Laki',
     onChanged: (bool? value){
        setState(){
            checkValue = value ?? false;
        }
    }
}

5.dropdown button, button
ialah widget tombol button. dropdwon button ialah data memberi opsi pengguna dan daftar pilihan bergulir kebawah.
cara membuat Dropdown dan button:
menggunakan widget items.
items: cosnt {
    DropdownMenuItem{
        value: 0,
        child: Text('pilih 1'),
    }
    DropdownMenuItem{
        value: 0,
        child: Text('pilih 2'),
    }
     DropdownMenuItem{
        value: 0,
        child: Text('pilih 3'),
    }
}
dan
ElevatedButton{
    child: Text('Submit),
    OnPressed: (){
        //
    }
}


