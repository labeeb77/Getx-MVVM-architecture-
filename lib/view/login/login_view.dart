import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/utils/utils.dart';
import 'package:getx_mvvm_pattern/view_model/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: loginVM.emailController.value,
                focusNode: loginVM.emailFocus.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar('Email', 'Please enter email');
                  }
                },
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, loginVM.emailFocus.value,
                      loginVM.passwordFocus.value);
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: loginVM.passwordController.value,
                focusNode: loginVM.passwordFocus.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar('Password', 'Please enter password');
                  }
                },
                onFieldSubmitted: (value) {},
                decoration: const InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      loginVM.loginApi();
                    }
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      )),
    );
  }
}
