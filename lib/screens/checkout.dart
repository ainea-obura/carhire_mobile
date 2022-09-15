import 'package:flutter/material.dart';

import '../widgets/BottomCheckoutSheet.dart';
import '../widgets/date_range_picker_widget.dart';

import 'package:sliding_sheet/sliding_sheet.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
              DateRangePickerWidget(),
              const SizedBox(height: 15),
              ElevatedButton(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
