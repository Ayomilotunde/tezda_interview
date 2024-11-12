import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_label_text_form_field.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/auth_provider.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/dialog.dart';
import 'package:tezda_interview/utils/next_screen.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_interview/views/auth/login_view.dart';
import 'package:tezda_interview/views/auth/verification_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  // final controller = Get.find<AuthController>( );

  @override
  Widget build(BuildContext context) {
    final formKey2 = GlobalKey<FormState>();
    return Consumer<AuthProvider>(
      builder: (context, controller, child)=>Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const YMargin(8),
                  const CustomNunitoText(
                    text: 'Create Your Aino Account',
                    textSize: 26,
                    fontWeight: FontWeight.w700,
                    alignText: TextAlign.start,
                  ),
                  const YMargin(7),
                  CustomNunitoText(
                    text: ' Fill the details below to create an account',
                    textColor: AppTheme.grey.shade300,
                    textSize: 14,
                    fontWeight: FontWeight.w400,
                    alignText: TextAlign.start,
                  ),
                  const YMargin(50),
                  CustomLabelInputText(
                    keyboardType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    label: '',
                    placeholder: "First Name",
                    onKeyUp: (value) {
                      controller.firstName = value;
                    },
                  ),
                  CustomLabelInputText(
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: '',
                    placeholder: "Last Name",
                    onKeyUp: (value) {
                      controller.lastName = value;
                    },
                  ),
                  CustomLabelInputText(
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    label: '',
                    placeholder: "Email address",
                    validate: (value) {
                      // Validator.validateEmail(value);
                      return Validator.validateIsNotEmpty(value);
                    },
                    onKeyUp: (value) {
                      controller.email = value;
                    },
                  ),
                  CustomLabelInputText(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    maxLines: 1,
                    label: '',
                    obscureText: !controller.showPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.showPassword =
                            !controller.showPassword;
                      },
                      iconSize: 20,
                      icon: Icon(controller.showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    validate: (value) {
                      return Validator.validateIsNotEmpty(value);
                    },
                    onKeyUp: (value) {
                      controller.password = value;
                    },
                    placeholder: "Password",
                  ),
                  CustomLabelInputText(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    maxLines: 1,
                    label: '',
                    obscureText: !controller.showPassword2,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.showPassword2 =
                            !controller.showPassword2;
                      },
                      iconSize: 20,
                      icon: Icon(controller.showPassword2
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    validate: (value) {
                      return Validator.validateIsNotEmpty(value);
                    },
                    onKeyUp: (value) {
                      controller.confirmedPassword = value;
                    },
                    placeholder: "Confirm Password",
                  ),
                  const YMargin(20),
                  Button(
                    onPressed: () {
                      if (formKey2.currentState != null &&
                          formKey2.currentState!.validate()) {
                          controller.createAccount().then((isSuccessful) {
                            if (isSuccessful) {
                              nextScreen(context, const VerificationPage());
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomAlertDialog(
                                        title: "SignUp Error",
                                        content: controller.errorMessage);
                                  });
                            }
                          });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const CustomAlertDialog(
                                  title: "Warning",
                                  content:
                                      "You need to fill the form before proceeding");
                            });
                        // Get.to(() => const VerificationPage());
                      }
                    },
                    text: "Create an Account",
                    color: AppTheme.primaryColor,
                    textColor: AppTheme.white,
                    block: true,
                  ),
                  const YMargin(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomNunitoText(
                        text: " Already have an account?",
                        textColor: AppTheme.grey.shade300,
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        alignText: TextAlign.center,
                      ),
                      const XMargin(5),
                      GestureDetector(
                        onTap: () {
                          nextScreen(context, const LoginView());
                        },
                        child: const CustomNunitoText(
                          text: ' Login',
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
          ),
      ),
    );
  }
}
