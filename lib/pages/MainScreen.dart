import 'package:flutter/material.dart';
import 'package:flutter_projct/categoryPages/headphones.dart';
import 'package:flutter_projct/categoryPages/mobiles.dart';
import 'package:flutter_projct/categoryPages/watches.dart';
import 'package:flutter_projct/pages/BottomNavigationBar.dart';
import 'package:flutter_projct/categoryPages/Laptops.dart';
import 'package:flutter_projct/pages/ProductDetails.dart';
import 'package:flutter_projct/lists/results.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MyMainScreen();
}

class _MyMainScreen extends State<MainScreen> {
  List categories = [
    {"icon": Icons.laptop, "title": "Laptop"},
    {"icon": Icons.phone_android_rounded, "title": "mobile"},
    {"icon": Icons.headphones, "title": "headphone"},
    {"icon": Icons.watch, "title": "watch"},
    {"icon": Icons.tv, "title": "mic"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(),
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.shop),
              Text(
                '  Electronics ',
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
              Text(
                'Store',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.purple[200],
                                  borderRadius: BorderRadius.circular(90)),
                              padding: EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Laptops()));
                                    case 1:
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Mobiles()));
                                    case 2:
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Headphones()));
                                    case 3:
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Watches()));
                                  }
                                },
                                child: Icon(
                                  categories[index]["icon"],
                                  size: 40,
                                ),
                              ),
                            ),
                            Text(
                              categories[index]['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    ));
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Results',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              GridView.builder(
                itemCount: results.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 280.0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                data: results[index],
                              )));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 300,
                            color: Colors.grey[200],
                            child: Image.asset(
                              results[index]["image"],
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            results[index]["title"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            results[index]["description"],
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            results[index]["price"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
