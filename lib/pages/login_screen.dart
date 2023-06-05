import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart%20';
import 'package:genielogiciel/controllers/auth_controller.dart';
import 'package:genielogiciel/pages/signup_screen.dart';
import 'package:genielogiciel/utils/social_buttons.dart';
import 'package:genielogiciel/utils/theme.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: _size.height,
          width: _size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/splash_icon.svg"),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  "Welcome Buddies",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Login to book your seat, I said its your seat",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                padding: const EdgeInsets.all(19.0),
                width: _size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login to your account",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: MyTheme.splash,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "UserName",
                          hintStyle: const TextStyle(color: Colors.black),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Forgort Password?",
                            content: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              controller: forgotEmailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Email address",
                                hintStyle:
                                    const TextStyle(color: Colors.black45),
                                fillColor: MyTheme.greyColor,
                                filled: true,
                              ),
                            ),
                            radius: 10,
                            onWillPop: () {
                              forgotEmailController.text = "";

                              return Future.value(true);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            confirm: ElevatedButton(
                              onPressed: () {
                                AuthController.instance.forgorPassword(
                                    forgotEmailController.text.trim());
                                forgotEmailController.text = "";
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: MyTheme.splash,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    "Send Reset Mail",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AuthController.instance.login(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: MyTheme.splash,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: Color(0xFFC1C1C1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: SocialLoginButtons(
                        onGoogleClick: () {
                          AuthController.instance.googleLogin();
                        },
                        onFbClick: () {},
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Don't have an account ? ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => SignupScreen()));

                        Get.to(SignupScreen());
                      },
                  ),
                  const TextSpan(
                    text: " here",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
