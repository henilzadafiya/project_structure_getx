class OtpResponse {
  int? status;
  String? message;
  String? errors;

  OtpResponse({this.status, this.message, this.errors});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errors'] = errors;
    return data;
  }
}
