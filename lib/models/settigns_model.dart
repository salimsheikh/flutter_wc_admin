// ignore_for_file: public_member_api_docs, sort_constructors_first
class SettingModel {
  String? password;
  String? username;
  SettingModel({
    this.password,
    this.username,
  });

  SettingModel.fromJson(Map<String, dynamic> json) {
    username = json['password'];
    password = json['username'];
  }

  Map<String, dynamic> joJson() {
    final Map<String, dynamic> data = <String, Map>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
