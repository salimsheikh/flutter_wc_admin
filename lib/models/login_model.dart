// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  late String host;
  late String key;
  late String secret;
  LoginModel({
    required this.host,
    required this.key,
    required this.secret,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    host = json['host'];
    key = json['key'];
    secret = json['secret'];
  }

  Map<String, dynamic> toJson() {
    //final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['host'] = host;
    data['key'] = key;
    data['secret'] = secret;
    return data;
  }
}
