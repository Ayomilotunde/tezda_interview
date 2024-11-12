import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/services/secure_storage/secure_storage.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/dialog.dart';
import 'package:tezda_interview/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/provider/user_provider.dart';
import 'package:tezda_interview/services/secure_storage/secure_storage.dart';
import 'package:tezda_interview/utils/string_utils.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/views/profile/components/edit_profile_item.dart';

import '../../provider/auth_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool toggle = false;
  bool disabled = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  DateTime? pickedDate;
  DateTime? selectedDate;

  // var firstname;
  // var lastname;

  @override
  void initState() {
    super.initState();
    // init();
  }

  Future<void> pickDOB() async {
    final DateTime now = DateTime.now();
    final DateTime minDate = DateTime(1900);
    final DateTime maxDate = DateTime(now.year - 18, now.month, now.day);
    pickedDate = await showDatePicker(
      context: context,
      initialDate: maxDate,
      firstDate: minDate,
      lastDate: maxDate,
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dobController.text = StringUtils.formatDate(selectedDate!);
        // authController.dob = pickedDate;
      });
    }
  }

  Future<void> init() async {
    final userController = Provider.of<UserProvider>(context, listen: true);
    // firstNameController.text = (await SecureStorage().retrieveUsrFirsName())!;
    // lastNameController.text = (await SecureStorage().retrieveUsrLastName())!;
    // dobController.text = (await SecureStorage().retrieveUserDOB())!.substring(0, 10);
    // genderController.text = (await SecureStorage().retrieveUserGender())!;

    firstNameController.text =
        userController.userProfile.user?.firstName ?? (await SecureStorage().retrieveUsrFirsName())!;
    lastNameController.text =
        userController.userProfile.user?.lastName ?? (await SecureStorage().retrieveUsrLastName())!;
    dobController.text = StringUtils.formatDate(userController.userProfile.user?.dob ?? DateTime.now());
    genderController.text =
        userController.userProfile.user?.gender ?? (await SecureStorage().retrieveUserGender())!;
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomNunitoText(
                          text: "Edit Profile",
                          textSize: 24,
                          fontWeight: FontWeight.w700,
                          textColor: AppTheme.black,
                          alignText: TextAlign.center,
                          softwrap: true,
                          maxline: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                YMargin(30.h),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: const BoxDecoration(
                             shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(AppImgAssets.logoWhite), fit: BoxFit.cover),
                              color: AppTheme.white),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${"Ayomide"} ${"Adeoye"}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff1E1E1E)),
                      ),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: Color(0xffA1A1A1),
                        ),
                        Text(
                          'Lagos, Nigeria',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xffA1A1A1)),
                        ),
                      ],
                    )
                  ],
                ),
                YMargin(30.h),
                EditProfileItem(
                  title: 'First Name',
                  hintText: 'Ayomide',
                  controller: firstNameController,
                  disabled: disabled,
                  onKeyUp: (value) {
                    // authController.firstName = value;
                  },
                ),
                EditProfileItem(
                  title: 'Last Name',
                  hintText: 'Adejoke',
                  controller: lastNameController,
                  disabled: disabled,
                  onKeyUp: (value) {
                    // authController.lastName = value;
                  },
                ),
                // const EditProfileItem(
                //     title: 'Phone number', hintText: '09123344556'),
                // const EditProfileItem(
                //     title: 'Location',
                //     hintText: '8 Flat Aroro-Makinde, Ojoo, Ibada. Nigeria'),
                EditProfileItem(
                  title: 'Gender',
                  hintText: 'Male',
                  controller: genderController,
                  disabled: disabled,
                  onKeyUp: (value) {
                    // authController.gender = value;
                  },
                ),
                GestureDetector(
                  onTap: () {
                    pickDOB();
                  },
                  child: EditProfileItem(
                    title: 'Date of Birth',
                    hintText: '1990-05-06',
                    controller: dobController,
                    disabled: disabled,
                    enabled: false,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 38,
                  child: Button(
                    onPressed: () {
                      if (toggle == false) {
                        setState(() {
                          toggle = true;
                          disabled = false;
                        });
                      } else {
                        // authController.dob = selectedDate ?? DateTime.now();

                      }
                    },
                    text: toggle ? 'Save Changes' : 'Edit Profile',
                    color: AppTheme.primaryColor,
                    borderColor: AppTheme.primaryColor,
                    block: true,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
