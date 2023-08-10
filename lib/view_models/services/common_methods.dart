
import 'package:intl/intl.dart';

String myDateFormat(String date)
{
  return DateFormat('dd-MMM-yyyy').format(DateTime.parse(date));
}

String myDateFormatMM(String date)
{
  return DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
}

String capitalize(String s) {
  if (s == "" || s.isEmpty) {
    return s;
  }
  return s[0].toUpperCase() + s.substring(1);
}


// String getTimeFromFileName(String fileName) {
//   // Remove file extension
//   String fileNameWithoutExtension = fileName.split('.').first;
//
//   // Extract the time substring
//   String timeSubstring = fileNameWithoutExtension.split('_')[2];
//
//   // Get the hour, minute, and second substrings
//   String hourSubstring = timeSubstring.substring(8, 10);
//   String minuteSubstring = timeSubstring.substring(10, 12);
//   String secondSubstring = timeSubstring.substring(12, 14);
//
//   // Convert hour substring to an integer
//   int hour = int.parse(hourSubstring);
//
//   // Determine if it's AM or PM
//   String period = (hour < 12) ? 'AM' : 'PM';
//
//   // Format the hour based on 12-hour clock format
//   if (hour > 12) {
//     hour -= 12;
//   } else if (hour == 0) {
//     hour = 12;
//   }
//
//   // Format the time string
//   String formattedTime = '$hour:$minuteSubstring:$secondSubstring $period';
//
//   return formattedTime;
// }
String getTimeFromFileName(String fileName) {
  // Remove file extension
  String fileNameWithoutExtension = fileName.split('.').first;

  // Extract the camera identifier and time substring
  List<String> parts = fileNameWithoutExtension.split('_');
  String cameraIdentifier = parts[1].substring(2);
  String timeSubstring = parts[2];

  // Get the hour, minute, and second substrings
  String hourSubstring = timeSubstring.substring(8, 10);
  String minuteSubstring = timeSubstring.substring(10, 12);
  String secondSubstring = timeSubstring.substring(12, 14);

  // Convert hour substring to an integer
  int hour = int.parse(hourSubstring);

  // Determine if it's AM or PM
  String period = (hour < 12) ? 'AM' : 'PM';

  // Format the hour based on 12-hour clock format
  if (hour > 12) {
    hour -= 12;
  } else if (hour == 0) {
    hour = 12;
  }

  // Format the time string
  String formattedTime = 'Cam:-$cameraIdentifier ($hour:$minuteSubstring:$secondSubstring $period)';

  return formattedTime;
}