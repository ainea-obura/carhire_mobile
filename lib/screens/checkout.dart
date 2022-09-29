import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/cars.dart';
import 'package:mobile/services/hire_service.dart';

import '../models/hire.dart';
import '../widgets/BottomCheckoutSheet.dart';
import '../widgets/date_range_picker_widget.dart';

import 'package:sliding_sheet/sliding_sheet.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key, required this.cars}) : super(key: key);
  final CarElement cars;

  @override
  State<Checkout> createState() => _CheckoutState(cars);
}

class _CheckoutState extends State<Checkout> {
  CarElement cars;
  _CheckoutState(this.cars); //constructor

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    startController.text = ""; //set the initial value of text field
    endController.text = "";
    super.initState();
  }

  Future<Hire>? _hire;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Date Range"),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller:
                              startController, //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(
                                  Icons.calendar_today), //icon of text field
                              labelText: "Enter Date" //label text of field
                              ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime
                                  .now(), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(DateTime.now().year + 5),
                            );

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                startController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        )),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Color(0xFF00A368)),
                        const SizedBox(width: 8),
                        Expanded(
                            child: TextField(
                          controller:
                              endController, //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(
                                  Icons.calendar_today), //icon of text field
                              labelText: "Enter Date" //label text of field
                              ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime
                                  .now(), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(DateTime.now().year + 5),
                            );

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                endController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              //DateRangePickerWidget(),
              const SizedBox(height: 15),
              Text(cars.price),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hire =
                        createHire(startController.text, endController.text);
                  });
                },
                child: const Text('Create Data'),
              ),
              /*ElevatedButton(
                style: ElevatedButton.styleFrom(onSurface: Colors.yellow),
                onPressed: () {
                  showSlidingBottomSheet(
                    context,
                    builder: (context) {
                      return SlidingSheetDialog(
                          elevation: 8,
                          cornerRadius: 16,
                          builder: (context, state) {
                            return BottomCheckoutSheet();
                          });
                    },
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
