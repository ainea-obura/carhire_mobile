import 'package:flutter/material.dart';
import 'package:mobile/screens/Details.dart';

import '../services/car_service.dart';
import '../models/cars.dart';

class CarsWidget extends StatefulWidget {
  const CarsWidget({Key? key}) : super(key: key);

  @override
  State<CarsWidget> createState() => _CarsWidgetState();
}

class _CarsWidgetState extends State<CarsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Available Cars",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A368),
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<Car>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 1 / 1.1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.cars.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CarDetails(
                                      cars: snapshot.data!.cars[index]),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 250,
                                  margin: const EdgeInsets.all(3),
                                  child: Image(
                                    image: NetworkImage(
                                      'http://192.168.8.122:8000${snapshot.data!.cars[index].thumbnail.toString()}',
                                    ),
                                    //NetworkImage(items[index].logo.toString()),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //height: 10,
                                    child: Text(
                                      snapshot.data!.cars[index].title
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF555555)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Row(
                                    children: [
                                      Text(
                                        snapshot.data!.cars[index].price
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF00A368)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                },
              );
            }
          },
          future: fetchData(),
        ),
      ],
    );
  }
}
