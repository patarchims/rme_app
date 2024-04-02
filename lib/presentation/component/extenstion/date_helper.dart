import 'package:intl/intl.dart';

String dateToString({String format = 'yyyyMMddHHmmss'}) {
  var now = DateTime.now();
  var formatter = DateFormat(format);
  String formattedDate = formatter.format(now);
  return formattedDate;
}

List<String> getMonthRekenig() {
  var date = DateTime.now().month;

  List<String> list = [];

  switch (date) {
    case 1:
      list.add("Januari");
      list.add("Desember");
      list.add("November");
      break;
    case 2:
      list.add("Februari");
      list.add("Januari");
      list.add("Desember");
      break;
    default:
      for (var i = date - 2; i <= date; i++) {
        switch (i) {
          case 1:
            {
              list.add('Januari');
            }
            break;
          case 2:
            {
              list.add('Februari');
            }
            break;
          case 3:
            {
              list.add('Maret');
            }
            break;
          case 4:
            {
              list.add('April');
            }
            break;
          case 5:
            {
              list.add('Mei');
            }
            break;
          case 6:
            {
              list.add('Juni');
            }
            break;
          case 7:
            {
              list.add('Juli');
            }
            break;
          case 8:
            {
              list.add('Agustus');
            }
            break;
          case 9:
            {
              list.add('September');
            }
            break;
          case 10:
            {
              list.add('Oktober');
            }
            break;
          case 11:
            {
              list.add('November');
            }
            break;
          default:
            {
              list.add('Desember');
            }
            break;
        }
      }
  }

  return list;
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 11) {
    return 'Pagi';
  }

  if (hour < 15) {
    return 'Siang';
  }

  if (hour < 17) {
    return 'Sore';
  }
  return 'Malam';
}

String panggilanNama({required String value}) {
  if (value == 'L') {
    return 'Bapak ';
  } else {
    return 'Ibu ';
  }
}

bool checkUlangTahun({required String date}) {
  DateTime now = DateTime.now();
  DateTime tanggal = DateTime.parse(date);

  if (now.month == tanggal.month && now.day == tanggal.day) {
    return true;
  } else {
    return false;
  }
}

String usia({required String date}) {
  DateTime now = DateTime.now();
  String tglLahir = date;
  DateTime tanggal = DateTime.parse(tglLahir);
  return (now.year - tanggal.year).toString();
}

bool isURL(String value) {
  return Uri.parse(value).isAbsolute;
}

int toNumberMonth(String value) {
  switch (value) {
    case 'Januari':
      return 1;
    case 'Februari':
      return 2;
    case 'Maret':
      return 3;
    case 'April':
      return 4;
    case 'Mei':
      return 5;
    case 'Juni':
      return 6;
    case 'Juli':
      return 7;
    case 'Agustus':
      return 8;
    case 'September':
      return 9;
    case 'Oktober':
      return 10;
    case 'November':
      return 11;
    default:
      return 12;
  }
}

String getBulanSekarang() {
  var now = DateTime.now();
  return now.month.toString();
}

String getBulan(int value) {
  String bulan = '';
  switch (value) {
    case 1:
      return bulan = "Januari";
    case 2:
      return bulan = "Februari";
    case 3:
      return bulan = "Maret";
    case 4:
      return bulan = "April";
    case 5:
      return bulan = "Mei";
    case 6:
      return bulan = "Juni";
    case 7:
      return bulan = "Juli";
    case 8:
      return bulan = "Agustus";
    case 9:
      return bulan = "September";
    case 10:
      return bulan = "Oktober";
    case 11:
      return bulan = "November";
    case 12:
      return bulan = "Desember";
  }
  return bulan;
}

String tglIndo(String value) {
  String tanggal = value.substring(8, 10);
  int b = int.parse(value.substring(5, 7));
  String bulan = getBulan(b);
  String tahun = value.substring(0, 4);
  return '$tanggal $bulan $tahun';
}

// String getExtention(String url) {
//   final File file = File(url);
//   final extenion = extension(file.path);
//   return extenion;
// }

List imageExtention = [
  '.bmp',
  '.BMP',
  '.GIF',
  '.gif',
  '.jpg',
  '.JPG',
  '.jpg',
  '.JPEG',
  '.png',
  '.PNG',
];
