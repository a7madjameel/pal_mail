class ApiController {
  static const String _baseUrl = "https://palmail.gsgtt.tech/api/";

  //Public Uri (Login and register)
  static const String login = "${_baseUrl}login";
  static const String register = "${_baseUrl}register";

  //****************************************************************************
  //User Uri
  static const String user = "${_baseUrl}user";
  static const String updateUser = "${_baseUrl}user/update";
  static const String logout = "${_baseUrl}logout";

  //****************************************************************************
  //Tags Uri
  static const String tags = "${_baseUrl}tags";
  //****************************************************************************
  //Status Uri
  static const String statuses = "${_baseUrl}statuses?mail=true";
  static const String categories = "${_baseUrl}categories";
  //****************************************************************************
  static const String mails = '${_baseUrl}mails';
}
