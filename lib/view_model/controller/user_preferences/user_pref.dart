import 'package:getx_mvvm_pattern/model/login/login_res_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(LoginResModel responseModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', responseModel.token!);
    pref.setBool('isLogin', responseModel.isLogin!);
    return true;
  }

  Future<LoginResModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    bool? isLogin = pref.getBool('isLogin');
    return LoginResModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    return true;
  }
}
