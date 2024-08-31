import 'package:flutter/material.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/home_page_body.dart';

import '../../../../core/utils/color_app.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex=0;
  List<Widget> displayScreen=[
    const HomePageBody(),
    const Text("Mohamed amr"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor:Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "abo Amr",
          ),
        ],
      ),
      body: displayScreen[currentIndex],
    );
  }
}
