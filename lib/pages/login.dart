import 'package:bbb_lbb/modules/user/controller.dart';
import 'package:bbb_lbb/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class LoginPage extends GetView<UserController> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  final userController = Get.put(UserController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        // Get.to(() => const Tabs());
        return Container();
      },
      onEmpty: _buildContent(context),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (msg) {
        showToast('$msg');
        return _buildContent(context);
      },
    );
  }

  /// 构建主页面
  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/ghost.png'),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '用户名',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '用户名不能为空';
                    }
                    return null;
                  },
                  controller: _userNameController,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '密码',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
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
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: ElevatedButton(
                      // style: ButtonStyle(
                      //   backgroundColor:
                      //       WidgetStateProperty.all(Color(pri)),
                      // ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          userController.login(_userNameController.text,
                              _passwordController.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('请输入账号和密码'),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "登录",
                        style: TextStyle(color: AppColors.mainTextColor1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
