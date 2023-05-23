import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../app_routes.dart';
import '../components/util/custom_return.dart';
import '../components/util/snackbar_message.dart';
import '../controllers/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum ScreenMode { auth, signUp }

enum TextFormType { email, password, confirmPassword }

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool _hidePassword = true;
  bool _isLoading = false;
  ScreenMode _screenMode = ScreenMode.auth;

  final Map<String, String> _authData = {'email': '', 'password': ''};

  void _submit() async {
    setState(() => _isLoading = true);

    if (!(_formKey.currentState?.validate() ?? true)) {
      setState(() => _isLoading = false);
    } else {
      _formKey.currentState?.save();
      AuthController authController = Provider.of(context, listen: false);
      CustomReturn custRet;
      try {
        if (_screenMode == ScreenMode.auth) {
          custRet = await authController.authenticate(
            email: _authData['email']!,
            password: _authData['password']!,
          );
          if (custRet.returnType == ReturnType.sucess) {
            Navigator.restorablePushNamedAndRemoveUntil(
              context,
              AppRoutes.bottomNav,
              (route) => false,
            );
          }
        } else {
          custRet = await authController.signUp(
            email: _authData['email']!,
            password: _authData['password']!,
          );
          if (custRet.returnType == ReturnType.sucess) {
            setState(() => _screenMode = ScreenMode.auth);
            SnackBarMessage(
              context: context,
              messageText: 'Sucessfully registered!',
              messageType: MessageType.sucess,
            );
          }
        }
        if (custRet.returnType == ReturnType.error) {
          SnackBarMessage(
            context: context,
            messageText: custRet.message,
            messageType: MessageType.error,
          );
        }
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget rowLoginButtons = ListView(
      shrinkWrap: true,
      children: [
        _isLoading
            ? const CircularProgressIndicator.adaptive()
            : Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: 'poppins'),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
        const SizedBox(width: 20),
      ],
    );
    Widget rowSignUpButtons = ListView(
      shrinkWrap: true,
      children: [
        _isLoading
            ? const CircularProgressIndicator.adaptive()
            : Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: 'poppins'),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
        const SizedBox(width: 20),
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 24),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                color: Color(0xFF404040),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_screenMode == ScreenMode.auth)
                      const Text(
                        'Welcome back to BajuLo!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'poppins',
                          fontSize: 20,
                        ),
                      ),
                    if (_screenMode == ScreenMode.signUp)
                      const Text(
                        'Welcome to BajuLo!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'poppins',
                          fontSize: 20,
                        ),
                      ),
                    const SizedBox(height: 12),
                    if (_screenMode == ScreenMode.auth)
                      Text(
                        'Log in to your account and keep the good times rolling.',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            height: 150 / 100),
                      ),
                    if (_screenMode == ScreenMode.signUp)
                      Text(
                        'Sign up for an account and enjoy faster checkout, order tracking, and exclusive deals.',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            height: 150 / 100),
                      ),
                    const SizedBox(height: 32),
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _textFormField(
                      textFormType: TextFormType.email,
                      controller: _emailController,
                      hintText: 'Insert Your E-mail',
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _textFormField(
                      textFormType: TextFormType.password,
                      controller: _passwordController,
                      hintText: 'Insert Your Password',
                    ),
                    if (_screenMode == ScreenMode.signUp)
                      const SizedBox(height: 16),
                    if (_screenMode == ScreenMode.signUp)
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontSize: 16,
                        ),
                      ),
                    if (_screenMode == ScreenMode.signUp)
                      const SizedBox(height: 12),
                    if (_screenMode == ScreenMode.signUp)
                      _textFormField(
                        textFormType: TextFormType.confirmPassword,
                        controller: _passwordConfirmController,
                        hintText: 'Confirm Your Password',
                      ),
                    const SizedBox(height: 24),
                    if (_screenMode == ScreenMode.auth) rowLoginButtons,
                    if (_screenMode == ScreenMode.signUp) rowSignUpButtons
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            if (_screenMode == ScreenMode.auth) {
              _screenMode = ScreenMode.signUp;
              setState(() {});
            } else {
              _screenMode = ScreenMode.auth;
              setState(() {});
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black.withOpacity(0.1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _screenMode == ScreenMode.auth
                    ? 'Dont have an account?'
                    : 'Already have an account?',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                _screenMode == ScreenMode.auth ? ' Sign Up' : ' Log In',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _textFormField({
    required TextFormType textFormType,
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextFormField(
      autofocus: false,
      obscureText: textFormType == TextFormType.email ? false : _hidePassword,
      keyboardType: textFormType == TextFormType.email
          ? TextInputType.text
          : TextInputType.emailAddress,
      onSaved: (value) => {
        if (textFormType == TextFormType.email)
          _authData['email'] = value ?? ''
        else if (textFormType == TextFormType.password)
          _authData['password'] = value ?? ''
      },
      validator: (value) {
        final finalValue = value ?? '';
        if (textFormType == TextFormType.email) {
          if (finalValue.trim().isEmpty) {
            return 'Insert your e-mail';
          }
          if (!finalValue.contains('@') || !finalValue.contains('.')) {
            return 'Please enter a valid email address';
          }
        } else if (textFormType == TextFormType.password) {
          if (finalValue.trim().isEmpty) {
            return 'Insert your password';
          }
          if (finalValue.trim().length < 6) {
            return 'Password must be at least 6 characters long';
          }
        } else {
          if (_screenMode == ScreenMode.signUp &&
              finalValue != _passwordController.text) {
            return 'Entered passwords do not match';
          }
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: textFormType == TextFormType.email
            ? Container(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/mail.svg',
                    color: Colors.black),
              )
            : Container(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/lock.svg',
                    color: Colors.black),
              ),
        suffixIcon: textFormType == TextFormType.email
            ? null
            : GestureDetector(
                onTap: () {
                  _hidePassword = !_hidePassword;
                  setState(() {});
                },
                child: Icon(
                    _hidePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black),
              ),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
      ),
    );
  }
}
