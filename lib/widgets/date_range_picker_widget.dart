import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatefulWidget {
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(hours: 24 * 3)),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final days = dateRange.duration;

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Date Range"),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: Text(DateFormat('yyyy/MM/dd').format(start)),
                  onPressed: pickDateRange,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Color(0xFF00A368)),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  child: Text(DateFormat('yyyy/MM/dd').format(end)),
                  onPressed: pickDateRange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Days: ${days.inDays}',
            style: TextStyle(fontSize: 32),
          )
        ],
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}
