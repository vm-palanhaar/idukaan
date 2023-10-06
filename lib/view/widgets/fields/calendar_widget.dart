import 'package:flutter/material.dart';
import 'package:idukaan/view/widgets/text_widget.dart';

class CalendarWidget extends StatefulWidget {
  final String title;
  final Function onTap;
  const CalendarWidget({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  String date = '';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.date_range_outlined),
      title: Text(widget.title),
      trailing: const Icon(Icons.calendar_month_outlined),
      onTap: () async {
        DateTime selectedDate = DateTime.now();
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate, // Refer step 1
          firstDate: DateTime(1990),
          lastDate: DateTime(2050),
        );
        if (picked != null && picked != selectedDate) {
          setState(
            () {
              selectedDate = picked;
              widget.onTap(selectedDate.toString().split(' ')[0]);
              date = selectedDate.toString().split(' ')[0];
            },
          );
        }
      },
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('yyyy-mm-dd'),
          TextWidget(
            text: date,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
