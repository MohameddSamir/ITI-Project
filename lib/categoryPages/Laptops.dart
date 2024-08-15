import 'package:flutter/material.dart';
import 'package:flutter_projct/lists/categorylists.dart';
import 'package:flutter_projct/pages/ProductDetails.dart';

class Laptops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Laptops',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
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
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          LaptopsList[index]["price"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
