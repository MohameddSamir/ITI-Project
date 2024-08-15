import 'package:flutter/material.dart';
import 'package:flutter_projct/lists/categorylists.dart';
import 'package:flutter_projct/pages/BottomNavigationBar.dart';
import 'package:flutter_projct/pages/ProductDetails.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(),
        appBar: AppBar(
          title: const Text(
            'Cart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: LaptopsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                data: LaptopsList[index],
                              )));
                    },
                    child: Container(
                      width: 250,
                      height: 350,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              LaptopsList[index]['image'],
                              height: 180,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              LaptopsList[index]["title"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              LaptopsList[index]["description"],
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              LaptopsList[index]["price"],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
// Sumbmit Button
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple)),
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ))),
          ],
        ));
  }
}
