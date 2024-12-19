import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter/core/constant/style.dart';
import 'package:tugas_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:tugas_flutter/features/auth/presentation/pages/register_page.dart';
import 'package:tugas_flutter/features/user/presentation/pages/user_page.dart';
import 'core/constant/string.dart';
import 'features/news/presentation/pages/get_started_page.dart';
import 'features/news/presentation/pages/home_page.dart';
import 'features/news/presentation/pages/profile_page.dart';
import 'features/news/presentation/pages/search_page.dart';
import 'features/user/presentation/bindings/user_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: StyleConst.myTextTheme),
      debugShowCheckedModeBanner: false,
      initialRoute: '/user',
      getPages: [
        GetPage(
          name: '/user',
          page: () => UserPage(),
          binding: UserBinding(),
        ),
        GetPage(
          name: '/started',
          page: () => const GetStartedPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const BottomBar(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/register',
          page: () => const RegisterPage(),
        ),
      ],
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  BottomBarStates createState() => BottomBarStates();
}

class BottomBarStates extends State<BottomBar> {
  int selectedPage = 0;

  final List<Widget> _pageOptions = [
    HomePage(),
    const SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: _pageOptions[selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: 'Profile'),
        ],
        selectedItemColor: const Color(0xff253B80),
        unselectedItemColor: const Color(0xff253B80).withOpacity(0.3),
        currentIndex: selectedPage,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }

  /// build app bar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 72,
      forceMaterialTransparency: true,
      centerTitle: true,
      title: selectedPage == 0
          ? Text(
              'NewsApp',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          : Container(),
      leading: Container(
          padding: const EdgeInsets.only(left: 32),
          child: Image.asset(
            menuIconPath,
            width: 40,
            height: 40,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Image.asset(searchIconPath),
        ),
      ],
    );
  }
}

// class CounterPage extends StatefulWidget{
//   const CounterPage({super.key});
//
//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }
//
// class _CounterPageState extends State<CounterPage> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter Page'),
//       ),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//                 onTap: (){
//                   counter--;
//                   setState(() {
//                   });
//                 },
//                 child: const Icon(Icons.remove)),
//             const SizedBox(width: 20,),
//             Text("Nilai Counter : $counter"),
//             const SizedBox(width: 20,),
//             InkWell(
//                 onTap: (){
//                   counter++;
//                   setState(() {
//                   });
//                 },
//                 child: const Icon(Icons.add)),
//           ],
//         ),
//       ),
//     );
//   }
// }

/* analisa state management
 * variable counter pertama kali di inisialisasi dengan nilai 0
 * ketika icon remove diklik atau tap, akan melakukan decrement terhadap nilai counter sebanyak jumlah tap
 * ketika icon add diklik atau tap, akan melakukan increment terhadap nilai counter sebanyak jumlah tap
 * pemanggilan setState() pada blok tersebut berfungsi untuk memperbarui nilai counter dan merender ulang halaman
 * menampilkan nilai counter pada sebuah widget Text dengan memasukan variable $counter
*/
