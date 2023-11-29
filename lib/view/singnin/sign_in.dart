import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/common_widgets/custom_textfield.dart';
import 'package:choose_n_fly/guest.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: ColorConstant.signBlue,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/signin.jpg"),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 80),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              child: Image.asset('assets/images/image 1.png')),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: 240,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 18, right: 18, bottom: 14),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Get.to(() => GuestPage());
                                },
                                child: Text('Sign In',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Sign in to access to your dashboard.',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: ColorConstant.liteBlack)),
                              const SizedBox(
                                height: 44,
                              ),
                              Text('User name',
                                  style: TextingStyle.font14boldblack),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextfield(
                                  hint: "Username",
                                  prefix: Image.asset(
                                      'assets/images/55  email.png'),
                                  controller: nameController),
                              const SizedBox(
                                height: 24,
                              ),
                              Text('Password',
                                  style: TextingStyle.font14boldblack),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextfield(
                                  hint: "Password",
                                  //suffix: Icon(Icons.visibility),
                                  prefix:
                                      Image.asset('assets/images/19  lock.png'),
                                  controller: passwordController),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                onTap: () {
                                  //  if (formKey.currentState!.validate()) {
                                  Get.offAll(() => HomeScreen());
                                  // }
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return HomeScreen();
                                  //   },
                                  // ));
                                },
                                child: CustomButton(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Sign In',
                                            style:
                                                TextingStyle.font16boldWhite),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                            'assets/images/22  user.png')
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
