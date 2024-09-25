import 'package:flutter/material.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/home_page_body.dart';

import '../../../topics/presentation/view/topics_view.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;
  List<Widget> displayScreen = [
    const HomePageBody(),
    const TopicsView(),
    const Center(child: Text("Author")),
    const Center(child: Text("Book Mark")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.topic_outlined),
            label: "topics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_rounded),
            label: "Author",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "Book Mark",
          ),
        ],
      ),
      body: displayScreen[currentIndex],
    );
  }
}
