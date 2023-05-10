import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_to_cart.dart';

import 'package:flutter_application_1/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFD),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: const [Icon(Icons.search)],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 35,
          ),
          const Text(
            'Delicious\nfood for you',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              hintText: 'search',
              filled: true,
              fillColor: Color(0xffe2e2e5),
            ),
          ),
          const SizedBox(height: 20),
          TabBar(
            labelColor: Colors.black,
            controller: _tabController,
            tabs: const [
              Tab(
                text: "Foods",
              ),
              Tab(
                text: "Drinks",
              ),
              Tab(
                text: "Snacks",
              ),
              Tab(
                text: "Sauce",
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('see more',
              style: TextStyle(color: Colors.red, fontSize: 15),
              textAlign: TextAlign.right),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                itemValue("Veggie\nTomato", "assets/images/hehe.jpg", 1900),
                itemValue(
                    "Spicy sauce\nfor chicken", "assets/images/hehe.jpg", 2300),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.telegram),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_sharp),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget itemValue(String name, String image, double price) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DetailsPage())),
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 20),
        height: categoryHeight,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                  radius: 48, // Image radius
                  backgroundImage: AssetImage('assets/images/hehe.jpg')),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "N $price",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
