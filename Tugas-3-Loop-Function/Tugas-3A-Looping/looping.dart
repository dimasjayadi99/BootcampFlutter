void main(){
  // call whileLoopProgram for number 1
  whileLoopProgram();
  print('');

  // call forLoopProgram for number 2
  forLoopProgram();
  print('');

  // call rectangleProgram for number 3
  rectangleProgram();
  print('');

  // call patternProgram for number 4
  patternProgram();
}

/// soal nomer 1 : while loop increment dan decrement program
void whileLoopProgram(){
  /*
  * set count number variable
  * start from 2
  * print title 'looping pertama' and 'looping kedua' for the title
  */
  var countNumber = 2;
  while(countNumber <= 20){
    // check condition if count number equals to 2, print title
    if(countNumber == 2){
      print('LOOPING PERTAMA');
    }
    // else print message
    print('$countNumber - I love coding');
    // increment countNumber
    countNumber+=2;
  }

  // reset countNumber value
  countNumber = 20;
  while(countNumber >= 2){
    // check condition if count number equals to 20, print title
    if(countNumber == 20){
      print('LOOPING KEDUA');
    }
    // else, print default output
    print('$countNumber - I Will become a mobile developer');
    // decrement countNumber
    countNumber-=2;
  }
}

/// soal nomer 2 : looping for
void forLoopProgram(){
  // variable
  var countNumber = 20;
  String message;

  // for loop with increment countNumber
  for(int i = 1; i <= countNumber; i++){
    // check condition
    if(i % 2 == 0){
      message = 'Berkualitas';
    }else if(i % 3 == 0){
      message = 'I Love Coding';
    }else{
      message = 'santai';
    }

    // print output
    print('$i - $message');
  }

}

/// soal nomer 3 : looping membentuk persegi panjang dengan simbol #
void rectangleProgram() {
  // variable
  var countNumber1 = 4;
  var countNumber2 = 8;
  String p;

  // first loop
  for(int i = 1; i <= countNumber1; i++){
    // set p variable with whitespace
    p = '';
    // second loop
    for(int j = 1; j <= countNumber2; j++){
      // set p variable with increment [j] and symbol '#'
      p += '#';
    }
    // print output
    print(p);
  }
}

/// soal nomer 4 : looping membentuk tangga dengan simbol #
void patternProgram() {
  // variable
  var countNumber = 7;
  String p;

  // first loop
  for(int i = 1; i <= countNumber; i++){
    p = '';
    // second loop
    for(int j = 1; j <= i; j++){
      // set p variable with increment [j] and symbol '#'
      p += '#';
    }
    // print output
    print(p);
  }

}