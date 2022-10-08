import 'package:flutter/material.dart';

import '../models/brands.dart';
import '../services/brand_service.dart';

class BrandsWidget extends StatefulWidget {
  const BrandsWidget({Key? key}) : super(key: key);

  @override
  State<BrandsWidget> createState() => _BrandsWidgetState();
}

class _BrandsWidgetState extends State<BrandsWidget> {
  List<Brand>? brands;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    brands = await BrandService().getBrands();
    if (brands != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Brands",
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
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6),
                        ],
                      ),
                      child: Image(
                        image: NetworkImage(
                          'http://192.168.8.138:8000${brands![index].logo}',
                        ),
                        //NetworkImage(items[index].imageURL.toString()),
                        fit: BoxFit.contain,
                      ),
                    );
                    /*return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 6),
                          ],
                        ),
                        child: Text(brands![index].logo),
                    );*/
                  },
                ),
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
