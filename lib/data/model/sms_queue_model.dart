class SmsQueueModel {
  // final int id;
  final String mobileNo;
  final String userName;
  final String massage;

  SmsQueueModel.fromJson(Map<String, dynamic> parsedJson)
      // : id = parsedJson['id'],
      : mobileNo = parsedJson['mobileNo'],
        userName = parsedJson['userName'],
        massage = parsedJson['massage'];

  // SmsQueueModel.fromDb(Map<String, dynamic> parsedJson)
  //     : id = parsedJson['id'],
  //       mobileNo = parsedJson['mobileNo'],
  //       userName = parsedJson['userName'],
  //       massage = parsedJson['massage'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // "id": id,
      "mobileNo": mobileNo,
      "userName": userName,
      "massage": massage,
    };
  }
}
