import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_label_text_form_field.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/auth_provider.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/next_screen.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:tezda_interview/views/auth/create_account_page.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final provider = Get.find<AuthController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: const Color(0XFFF1F3FB),
        extendBodyBehindAppBar: true,
        body:Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                // color: AppTheme.primaryColor,
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 260,
                        left: 80,
                        right: 80,
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                              // color: pageColor,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/logo_white.png"), fit: BoxFit.contain)),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 444,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const YMargin(30),
                                  const CustomNunitoText(
                                      text: "Welcome Back!",
                                      textSize: 24,
                                      fontWeight: FontWeight.w700,
                                      textColor: AppTheme.black,
                                      alignText: TextAlign.center,
                                      softwrap: true,
                                      maxline: 2,
                                      overflow: TextOverflow.ellipsis),
                                  const YMargin(1),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10.0, left: 10),
                                    child: CustomNunitoText(
                                        text: "Sign in to an existing account",
                                        textSize: 16,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppTheme.black,
                                        alignText: TextAlign.center,
                                        softwrap: true,
                                        maxline: 4,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const YMargin(0),
                                  CustomLabelInputText(
                                    // provider: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    inputAction: TextInputAction.next,
                                    label: '',
                                    placeholder: "Email address",
                                    validate: (value) {
                                      // Validator.validateEmail(value);
                                      return Validator.validateIsNotEmpty(value);
                                    },
                                    onKeyUp: (value) {
                                      provider.email = value;
                                    },
                                  ),
                                  CustomLabelInputText(
                                    // provider: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    inputAction: TextInputAction.done,
                                    label: '',
                                    maxLines: 1,
                                    obscureText: !provider.showPassword,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        provider.showPassword = !provider.showPassword;
                                      },
                                      iconSize: 20,
                                      icon:
                                          Icon(provider.showPassword ? Icons.visibility_off : Icons.visibility),
                                    ),
                                    validate: (value) {
                                      return Validator.validateIsNotEmpty(value);
                                    },
                                    onKeyUp: (value) {
                                      provider.password = value;
                                    },
                                    placeholder: "Password",
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Get.to(() => const ForgotPasswordView());
                                    },
                                    child: const CustomNunitoText(
                                      text: ' Forgot Password?  ',
                                      textColor: AppTheme.primaryColor,
                                      textSize: 14,
                                      fontWeight: FontWeight.w500,
                                      alignText: TextAlign.end,
                                    ),
                                  ),
                                  const YMargin(20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                                    child: Column(
                                      children: [
                                        Button(
                                          onPressed: () async {
                                            if (formKey.currentState?.validate() == true) {
                                              await provider.logIn(context);
                                            }
                                          },
                                          text: 'Login',
                                          color: AppTheme.primaryColor,
                                          borderColor: AppTheme.transparent,
                                          block: true,
                                          textColor: Colors.white,
                                        ),
                                        const YMargin(10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomNunitoText(
                                              text: " Don't have an account?",
                                              textColor: AppTheme.grey.shade300,
                                              textSize: 14,
                                              fontWeight: FontWeight.w400,
                                              alignText: TextAlign.center,
                                            ),
                                            const XMargin(5),
                                            GestureDetector(
                                              onTap: () {
                                                nextScreen(context, CreateAccountPage());
                                              },
                                              child: const CustomNunitoText(
                                                text: ' Create an Account',
                                                textColor: AppTheme.primaryColor,
                                                textSize: 14,
                                                fontWeight: FontWeight.w500,
                                                alignText: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),

      ),
    );
  }
}
