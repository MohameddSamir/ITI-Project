import 'package:flutter/material.dart';
import 'package:flutter_projct/lists/categorylists.dart';
import 'package:flutter_projct/pages/ProductDetails.dart';

class Watches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mobiles',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: watchesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            data: watchesList[index],
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
                          watchesList[index]['image'],
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          watchesList[index]["title"],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          watchesList[index]["description"],
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          watchesList[index]["price"],
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
