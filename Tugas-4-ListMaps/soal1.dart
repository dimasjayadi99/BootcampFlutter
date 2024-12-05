void main(){
  // call range()
  print(range(1, 10));
  print(range(10, 1));
}

/// soal : membuat fungsi yang mengembalikan sebuah list
List<int> range(num1, num2){
  // variable
  List<int> list = [];

  /* check condition
  * if num1 <= num2 -> increment
  * else -> decrement
   */
  if(num1 <= num2){
    for(int i = num1; i <= num2; i++){
      // add data
      list.add(i);
    }
  }else{
    for(int i = num1; i >= num2; i--){
      // add data
      list.add(i);
    }
  }

  // print output
  return list;
}