import 'package:pal_mail/providers/Provider.dart';

class CategoryProvider extends Provider {
  List items = [
    'Official organization',
    'NGOs',
    'UnBorder',
    'Others',
  ];
  @override
  getData() {
    if (data == null) {
      return items[items.length - 1];
    }
    return items[data];
  }

  getIndex() {
    if (data == null) {
      return items.length - 1;
    }
    return data;
  }
}
