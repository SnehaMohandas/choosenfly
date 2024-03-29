import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/common_widgets/custom_textfield.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/registration/registration_screen.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/login/login_controller.dart';
import 'package:choose_n_fly/view/payment/payment_screen.dart';
import 'package:choose_n_fly/view/splash/controller/splash_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RegistrationSCreen extends StatelessWidget {
  RegistrationSCreen({super.key});
  final NetworkController networkController = Get.put(NetworkController());

  final LoginController loginController = Get.put(LoginController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
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
                        decoration: const BoxDecoration(
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
                                  child: Image.asset(
                                'assets/images/logo.png',
                                height: 60,
                                width: 140,
                              )),
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
                          decoration: const BoxDecoration(
                              color: ColorConstant.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          // height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 18, right: 18, bottom: 14),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(() => GuestPage());
                                      },
                                      child: const Text('Sign Up',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 44,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: "First Name",
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                        contentPadding: const EdgeInsets.all(4),
                                        prefixIcon: const Icon(
                                          Icons.person_outline_outlined,
                                          color: ColorConstant.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == "") {
                                          return "Please enter your name";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: "Last Name",
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                        contentPadding: const EdgeInsets.all(4),
                                        prefixIcon: const Icon(
                                          Icons.person_2_outlined,
                                          color: ColorConstant.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == "") {
                                          return "Please enter your name";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: "Company Name",
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                        contentPadding: const EdgeInsets.all(4),
                                        prefixIcon: const Icon(
                                          Icons.business_outlined,
                                          color: ColorConstant.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == "") {
                                          return "Please enter your name";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: "Phone",
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                        contentPadding: const EdgeInsets.all(4),
                                        prefixIcon: const Icon(
                                          Icons.phone_outlined,
                                          color: ColorConstant.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == "") {
                                          return "Please enter your name";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                        contentPadding: const EdgeInsets.all(4),
                                        prefixIcon: const Icon(
                                          Icons.mail_outline,
                                          color: ColorConstant.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == "") {
                                          return "Please enter your name";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: "Address",
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                        contentPadding: const EdgeInsets.all(4),
                                        prefixIcon: const Icon(
                                          Icons.home_outlined,
                                          color: ColorConstant.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: ColorConstant.grey)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value == "") {
                                          return "Please enter your name";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  57, 0, 0, 0)),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: CountryCodePicker(
                                        onChanged: (CountryCode code) {
                                          print("New Country selected: " +
                                              code.toString());
                                        },
                                        showFlagDialog: true,
                                        initialSelection: 'US',
                                        showDropDownButton: true,
                                        // favorite: ['+1', 'US'],
                                        showCountryOnly: true,
                                        showOnlyCountryWhenClosed: true,
                                        alignLeft: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Obx(
                                      () => TextFormField(
                                        obscureText:
                                            loginController.obscureText.value,
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              const TextStyle(fontSize: 14),
                                          contentPadding:
                                              const EdgeInsets.all(4),
                                          prefixIcon: const Icon(
                                            Icons.lock_outline,
                                            color: ColorConstant.grey,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              loginController
                                                  .toggleVisibility();
                                            },
                                            icon: loginController
                                                        .obscureText.value ==
                                                    true
                                                ? const Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: ColorConstant.black,
                                                    size: 22,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .visibility_off_outlined,
                                                    color: ColorConstant.black,
                                                    size: 22,
                                                  ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: ColorConstant.grey)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: ColorConstant.grey)),
                                        ),
                                        validator: (value) {
                                          if (value == null || value == "") {
                                            return "Please enter your password";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          loginController.login(
                                              nameController.text,
                                              passwordController.text);
                                        }

                                        // Get.offAll(HomeScreen(),
                                        //     transition:
                                        //         Transition.rightToLeftWithFade);
                                      },
                                      child: CustomButton(
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Register',
                                                  style: TextingStyle
                                                      .font16boldWhite),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                  'assets/images/22  user.png')
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
      } else {
        // Get.find<SplashController>().isNoNet.value = true;
        return networkController.noDataImage(context);
      }
    });
  }
}
