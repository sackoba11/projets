// import 'package:intl/date_symbol_data_local.dart';

// class DateFormat {
//   String convert(String? timestamp) {
//     initializeDateFormatting();
//     int? timeInt = int.tryParse(timestamp!);
//     DateTime now = DateTime.now();
//     DateTime dateposte = DateTime.fromMillisecondsSinceEpoch(timeInt!);
//     DateFormat format;
//     if (now.difference(dateposte).inDays > 0) {
//       format = DateFormat.yMMMEd("fr_FR");
//     } else {
//       format = DateFormat.Hm("fr_FR");
//     }
//     return format.format(dateposte).toString();
//   }
// }  
