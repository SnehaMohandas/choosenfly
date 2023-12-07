import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  List leading = [Icons.person, Icons.email, Icons.phone];
  List title = ["Name", "E-mail", "Phone"];
  List subtitle = ["John Thomas", "jh@gmail.com", "9876543210"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // toolbarHeight: 82,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'My Profile',
          style: TextStyle(
              color: ColorConstant.black,
              fontSize: MediaQuery.of(context).size.height * 0.023),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/Free Vector Gradient wavy background.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/IMG_20231206_145526-removebg-preview.png"),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Balance",
                            style: TextStyle(
                              color: ColorConstant.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Today, 06 Dec 2023",
                            style: TextStyle(
                              color: ColorConstant.grey,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "\$ 50,000",
                            style: TextStyle(
                              color: ColorConstant.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 212, 233, 239),
              ),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: leading.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: ColorConstant.lightBlue,
                          child: Icon(
                            leading[index],
                            color: ColorConstant.white,
                          )),
                      title: Text(
                        title[index],
                      ),
                      subtitle: Text(subtitle[index]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
