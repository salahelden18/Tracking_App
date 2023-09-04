import 'package:intl/intl.dart';

String afterTwoDays(String local) {
  DateTime currenctDate = DateTime.now();

  DateTime resultDate = currenctDate.add(const Duration(days: 2));

  String formattedDate = DateFormat('dd/MM/yyyy', local).format(resultDate);

  return formattedDate;
}
