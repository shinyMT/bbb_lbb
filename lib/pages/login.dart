import 'package:bbb_lbb/pages/tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _userNameController = TextEditingController();
  var _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/main.jpeg'),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: '用户名'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '用户名不能为空';
                    }
                    return null;
                  },
                  controller: _userNameController,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: '密码'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '密码不能为空';
                    }
                    return null;
                  },
                  controller: _passwordController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print(
                            "${_userNameController.text}, ${_passwordController.text}");
                        if (['bbb', 'lbb'].contains(_userNameController.text)) {
                          Get.to(const Tabs());
                        }
                      },
                      child: const Text("登陆"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
