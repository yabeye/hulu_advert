import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:hulu_advert/src/views/shared/shared.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  late final FocusNode _fullNameFocus;
  late final FocusNode _phoneFocus;
  late final FocusNode _usernameFocus;
  late final FocusNode _passwordFocus;

  bool _isPasswordVisible = true;

  @override
  void initState() {
    super.initState();

    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    _fullNameFocus = FocusNode();
    _phoneFocus = FocusNode();
    _usernameFocus = FocusNode();
    _passwordFocus = FocusNode();
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

    super.dispose();
  }

  void _onSignUp() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Common.dismissKeyboard();
    Common.showNotification(
      title: "Register",
      body: "You have registered Successfully",
    );
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
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  20.height(),
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
                    onFieldSubmitted: (v) {
                      _phoneFocus.unfocus();
                      FocusScope.of(context).requestFocus(_usernameFocus);
                    },
                    validator: (v) => InputValidators.isRequired(
                      v,
                      message: "phone is required",
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
                    onFieldSubmitted: (v) {
                      _passwordFocus.unfocus();
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
        24.height(),
        AppButton(
          onPressed: isLoading ? null : _onSignUp,
          text: "Register",
        ),
        50.height(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?", style: textTheme.labelLarge),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Login",
                style: textTheme.labelLarge!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
