import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String? token;
    bool? isLogin;

    LoginResModel({
        required this.token,required this.isLogin
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        token: json["token"],
        isLogin: json["token"]
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "isLogin":token
    };
}
