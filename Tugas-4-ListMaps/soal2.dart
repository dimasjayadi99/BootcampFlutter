void main(){
  // call rangeWithStep()
  print(rangeWithStep(30, 23, 3));
  print(rangeWithStep(1, 10, 2));
}

/// soal : membuat fungsi yang mengembalikan sebuah list dengan tambahan stepper
List<int> rangeWithStep(int num1, int num2, int step){
  // variable
  List<int> list = [];

  /* check condition
  * if num1 <= num2 -> increment
  * else -> decrement
   */
  if(num1 <= num2){
    for(int i = num1; i <= num2; i += step){
      // add data
      list.add(i);
    }
  }else{
    for(int i = num1; i >= num2; i -= step){
      // add data
      list.add(i);
    }
  }

  // print output
  return list;
}