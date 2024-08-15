import 'package:flutter/material.dart';
import 'package:flutter_projct/lists/categorylists.dart';
import 'package:flutter_projct/pages/ProductDetails.dart';

class Headphones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'HeadPhones',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: headphonesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            data: headphonesList[index],
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
                          headphonesList[index]['image'],
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          headphonesList[index]["title"],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          headphonesList[index]["description"],
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          headphonesList[index]["price"],
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
