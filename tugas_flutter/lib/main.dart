import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget{
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: (){
                  counter--;
                  setState(() {
                  });
                },
                child: const Icon(Icons.remove)),
            const SizedBox(width: 20,),
            Text("Nilai Counter : $counter"),
            const SizedBox(width: 20,),
            InkWell(
                onTap: (){
                  counter++;
                  setState(() {
                  });
                },
                child: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}


/* analisa state management
 * variable counter pertama kali di inisialisasi dengan nilai 0
 * ketika icon remove diklik atau tap, akan melakukan decrement terhadap nilai counter sebanyak jumlah tap
 * ketika icon add diklik atau tap, akan melakukan increment terhadap nilai counter sebanyak jumlah tap
 * pemanggilan setState() pada blok tersebut berfungsi untuk memperbarui nilai counter dan merender ulang halaman
 * menampilkan nilai counter pada sebuah widget Text dengan memasukan variable $counter
*/