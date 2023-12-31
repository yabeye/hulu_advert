import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/auth_controller.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/models/models.dart';
import 'package:hulu_advert/src/routes/app_routes.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:hulu_advert/src/views/shared/shared.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _authController = Get.find<AuthController>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _conformPasswordController;

  late final FocusNode _fullNameFocus;
  late final FocusNode _phoneFocus;
  late final FocusNode _usernameFocus;
  late final FocusNode _passwordFocus;
  late final FocusNode _conformPasswordFocus;

  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _conformPasswordController = TextEditingController();

    _fullNameFocus = FocusNode();
    _phoneFocus = FocusNode();
    _usernameFocus = FocusNode();
    _passwordFocus = FocusNode();
    _conformPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();

    _fullNameFocus.dispose();
    _phoneFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _conformPasswordFocus.dispose();

    super.dispose();
  }

  _onSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final newUser = UserModel(
      fullName: _fullNameController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
      createdAt: DateTime.now(),
    );

    try {
      Common.showLoading();
      await _authController.signUp(user: newUser);
      Get.back();
      Common.dismissKeyboard();
      Get.offAllNamed(AppRoutes.home);
      Common.showNotification(
        title: "Success",
        body: "Registered Successfully",
      );

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
      appBar: CustomAppBar(),
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
                      "Register",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  30.height(),
                  TextFormField(
                    controller: _fullNameController,
                    focusNode: _fullNameFocus,
                    decoration: getInputDecoration(
                      "full name",
                      prefixIcon: FontAwesomeIcons.user,
                    ),
                    onFieldSubmitted: (v) {
                      _fullNameFocus.unfocus();
                      FocusScope.of(context).requestFocus(_phoneFocus);
                    },
                    validator: (v) => InputValidators.isRequired(
                      v,
                      message: "full name is required",
                    ),
                  ),
                  10.height(),
                  TextFormField(
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                    keyboardType: TextInputType.phone,
                    decoration: getInputDecoration(
                      "phone",
                      prefixIcon: Icons.phone,
                    ),
                    maxLength: 13,
                    onFieldSubmitted: (v) {
                      _phoneFocus.unfocus();
                      FocusScope.of(context).requestFocus(_usernameFocus);
                    },
                    validator: (v) => InputValidators.withInRange(
                      v,
                      min: 9,
                    ),
                  ),
                  10.height(),
                  TextFormField(
                    controller: _usernameController,
                    focusNode: _usernameFocus,
                    decoration: getInputDecoration(
                      "username",
                      prefixIcon: Icons.abc,
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
                    maxLength: 32,
                    onFieldSubmitted: (v) {
                      _passwordFocus.unfocus();
                      FocusScope.of(context)
                          .requestFocus(_conformPasswordFocus);
                    },
                    validator: (v) => InputValidators.withInRange(
                      v,
                      min: 6,
                    ),
                  ),
                  10.height(),
                  TextFormField(
                    controller: _conformPasswordController,
                    focusNode: _conformPasswordFocus,
                    obscureText: !_isPasswordVisible,
                    decoration: getInputDecoration(
                      "confirm password",
                      prefixIcon: Icons.lock_outline,
                      // suffixIcon: InkWell(
                      //   onTap: () {
                      //     _isPasswordVisible = !_isPasswordVisible;
                      //     setState(() {});
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(right: 8.0),
                      //     child: Icon(
                      //       _isPasswordVisible
                      //           ? Icons.visibility_off_outlined
                      //           : Icons.visibility_outlined,
                      //     ),
                      //   ),
                      // ),
                    ),
                    maxLength: 32,
                    onFieldSubmitted: (v) {
                      _conformPasswordFocus.unfocus();
                    },
                    validator: (v) => InputValidators.withInRange(
                      v,
                      min: 6,
                      similar: _passwordController.text,
                      message: "passwords don't match",
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
        24.height(),
        AppButton(
          onPressed: isLoading ? null : _onSignUp,
          text: "Register",
        ),
        50.height(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?", style: textTheme.bodySmall),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Login",
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
