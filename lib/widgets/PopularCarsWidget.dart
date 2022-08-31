/*import 'package:flutter/material.dart';

import '../models/cars.dart';
import '../services/car_service.dart';

class PopularCarsWidget extends StatefulWidget {
  const PopularCarsWidget({Key? key}) : super(key: key);

  @override
  State<PopularCarsWidget> createState() => _PopularCarsWidgetState();
}

class _PopularCarsWidgetState extends State<PopularCarsWidget> {
  /*List<Car>? cars;
  var isLoaded = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cars = await CarService().getCars();
    if (cars != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }*/

  late Future<Car> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
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
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            //padding: EdgeInsets.all(5),
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: futureData,
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<Car>;
                    return ListView.builder(
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                      image: NetworkImage(
                                        'http://192.168.8.160:8000${items[index].thumbnail}',
                                      ),
                                      //NetworkImage(items[index].logo.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            items[index].title.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                              items[index].status.toString()),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              /*child: FutureBuilder<Car>(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.cars.length,
                      itemBuilder: (context, index) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.cars[index].images.length,
                          itemBuilder: (context, index1) {
                            return Container(
                              height: 50,
                              child: Text(
                                  snapshot.data!.cars[index].title.toString()),
                            );
                          },
                        );
                      },
                    );
                  }
                },
                future: fetchData(),
              ),*/
            ),
          ),
        ),
      ],
    );
  }
}
*/
