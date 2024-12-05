void main(){

  // example data
  var data = [
    ['001', 'Dimas Jayadi', 'Jakarta', '02/11/1999', 'Programming'],
    ['002','Fira Agustin', 'Bandung', '04/10/2000', 'Musik'],
    ['003','Reza Okta', 'Banten', '12/1/1998', 'Gaming'],
  ];

  // call dataHandling()
  dataHandling(data);
}

/// soal : membuat fungsi yang mengembalikan argument[n]
void dataHandling(List<List<String>> list){
  for(var data in list){
    // print data by index
    print('Nomor Id : ${data[0]}');
    print('Nama Lengkap : ${data[1]}');
    print('TTL : ${data[2]}, ${data[3]}');
    print('Hobby : ${data[4]}');
    print('----');
  }
}