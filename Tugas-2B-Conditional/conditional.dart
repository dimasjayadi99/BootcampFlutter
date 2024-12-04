import 'dart:io';

void main(){
  // call ternaryOperator() for number 1
  ternaryOperator();
  print('');

  // call werewolfGame() for number 2
  werewolfGame();
  print('');

  // call quotesSwitchCase() for number 3
  quotesSwitchCase();
  print('');

  // call monthSwitchCase() for number 4
  monthSwitchCase();
}

/// soal nomer 1 : ternary operator
void ternaryOperator(){
  print('Apakah anda ingin menginstall aplikasi? (y/t)');
  var answer = stdin.readLineSync();

  // check answer
  final message =
  (answer == 'y')
      ? 'anda akan menginstall aplikasi dart' :
  (answer == 't')
      ? 'aborted'
      : 'input tidak valid';

  // print output
  print(message);

}

/// soal nomer 2 : if - else if dan else program
void werewolfGame(){
  // variable
  var listRole = ['penyihir', 'guard', 'werewolf'];
  var message;

  // input name
  print('Masukan nama anda : ');
  var name = stdin.readLineSync();

  if(name != ''){
    // input role
    print('Masukan peran anda (Penyihir, Guard, Werewolf) : ');
    var role = stdin.readLineSync()?.toLowerCase();

    // check condition
    if(role == ''){
      message = 'Halo $name, Pilih peranmu untuk memulai game!';
    } else if(role == listRole[0]){
      message = 'Halo $role $name, kamu dapat melihat siapa yang menjadi werewolf!';
    }else if(role == listRole[1]){
      message = 'Halo $role $name, kamu akan membantu melindungi temanmu dari serangan werewolf!';
    }else if(role == listRole[2]){
      message = 'Halo $role $name, Kamu akan memakan mangsa setiap malam!';
    }else{
      message = 'Halo $name, maaf saat ini peran $role tidak tersedia';
    }
  }else{
    message = 'Nama wajib di isi!';
  }

  // print output
  print(message);

}

/// soal nomer 3 : Switch case quotes
void quotesSwitchCase() {
  // list quotes
  List<String> quotesList = [
    'Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.',
    'Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.',
    'Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.',
    'Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.',
    'Hidup tak selamanya tentang pacar.',
    'Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.',
    'Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.',
  ];

  print("Masukan nama hari [Senin - Minggu] untuk mendapatkan quotes : ");
  var day = stdin.readLineSync()?.toLowerCase();

  var message;

  // switch case nama hari
  switch(day){
    case 'senin' :
      message = quotesList[0];
    case 'selasa' :
      message = quotesList[1];
    case 'rabu' :
      message = quotesList[2];
    case 'kamis' :
      message = quotesList[3];
    case 'jumat' :
      message = quotesList[4];
    case 'sabtu' :
      message = quotesList[5];
    case 'minggu' :
      message = quotesList[6];
    default :
      message = 'Nama hari tidak valid!';
  }

  // print output
  print('$message');

}

/// soal nomer 4 : Switch case format bulan
void monthSwitchCase(){
  // variable
  var tanggal = 21;
  var bulan = 1;
  var tahun = 1945;
  var namaBulan;

  // check range tanggal 1- 31
  if(tanggal < 1 || tanggal > 31){
    print('Bulan tidak valid');
    return;
  }

  // checkk range bulan 1- 12
  if(bulan < 1 || bulan > 12){
    print('Bulan tidak valid');
    return;
  }

  if(tahun < 1900 || tahun > 2200){
    print('Bulan tidak valid');
    return;
  }

  // check nama bulan dengan switch case
  switch(bulan){
    case 1 :
      namaBulan = 'Januari';
      break;
    case 2 :
      namaBulan = 'Februari';
      break;
    case 3 :
      namaBulan = 'Maret';
      break;
    case 4 :
      namaBulan = 'April';
      break;
    case 5 :
      namaBulan = 'Mei';
      break;
    case 6 :
      namaBulan = 'Juni';
      break;
    case 7 :
      namaBulan = 'Juli';
      break;
    case 8 :
      namaBulan = 'Agustus';
      break;
    case 9 :
      namaBulan = 'September';
      break;
    case 10 :
      namaBulan = 'Oktober';
      break;
    case 11 :
      namaBulan = 'November';
      break;
    case 12 :
      namaBulan = 'Desember';
      break;
    default :
      namaBulan = 'nama bulan tidak valid!';
      break;
  }

  // print output
  print('$tanggal $namaBulan $tahun');

}