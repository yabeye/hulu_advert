import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/auth_controller.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/routes/routes.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:hulu_advert/src/views/shared/shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _authController = Get.find<AuthController>();

  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  late final FocusNode _usernameFocus;
  late final FocusNode _passwordFocus;

  bool _isRemember = false;
  bool _isPasswordVisible = true;

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    _usernameFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  _onLogIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      Common.showLoading();
      await _authController.login(
        username: _usernameController.text,
        password: _passwordController.text,
      );
      Get.back();

      Common.dismissKeyboard();
      Common.showNotification(title: "Log In", body: "Logged in Successfully");

      Get.offAllNamed(AppRoutes.home);
    } on HttpException catch (e) {
      Get.back();
      Common.showError(e.message);
    } catch (e) {
      Get.back();
      Common.showError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return Scaffold(
      appBar: CustomAppBar(showLeading: false),
      body: StackLoader(
        isLoading: isLoading,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Log In",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  50.height(),
                  TextFormField(
                    controller: _usernameController,
                    focusNode: _usernameFocus,
                    decoration: getInputDecoration(
                      "username",
                      prefixIcon: FontAwesomeIcons.user,
                    ),
                    onFieldSubmitted: (v) {
                      _usernameFocus.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                    validator: (v) => InputValidators.isRequired(
                      v,
                      message: "username is required",
                    ),
                  ),
                  10.height(),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: !_isPasswordVisible,
                    decoration: getInputDecoration(
                      "password",
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: InkWell(
                        onTap: () {
                          _isPasswordVisible = !_isPasswordVisible;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ),
                    onFieldSubmitted: (v) {
                      _usernameFocus.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocus);
                      _onLogIn();
                    },
                    validator: (v) => InputValidators.isRequired(
                      v,
                      message: "password is required",
                    ),
                  ),
                  _buildBottomWidgets(isLoading: isLoading),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomWidgets({required bool isLoading}) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Checkbox(
        //       onChanged: (bool? v) {
        //         _isRemember = v ?? false;
        //       },
        //       value: _isRemember,
        //     ),
        //     Text(
        //       "remember me",
        //       style: textTheme.labelLarge,
        //     )
        //   ],
        // ),
        24.height(),
        AppButton(
          onPressed: isLoading ? null : _onLogIn,
          text: "Log In",
        ),
        50.height(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?", style: textTheme.bodySmall),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.register),
              child: Text(
                "Register",
                style: textTheme.bodySmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
