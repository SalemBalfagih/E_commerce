import 'package:e_commerce/controller/Profile_controller.dart';

import 'package:e_commerce/themes.dart';
import 'package:e_commerce/view/widgets/Profile/CustomAboutMe.dart';
import 'package:e_commerce/view/widgets/Profile/CustomDeveloperName.dart';
import 'package:e_commerce/view/widgets/Profile/CustomPersonalImage.dart';
import 'package:e_commerce/view/widgets/Profile/CustomSocialMedia.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      body: Column(
        children: [
          const CustomPersonalImage(),
          Expanded(
              child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
              vertical: MediaQuery.sizeOf(context).height * 0.08,
            ),
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              const CustomDeveloperName(),
              Center(
                child: Text(
                    textAlign: TextAlign.center,
                    "mobile application developer specialization in flutter development",
                    style: textTheme1.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 186, 185, 185))),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSocialMedia(
                    assetName: 'lib/images/github.png',
                    seconds: 1,
                    onTap: () {
                      profileController
                          .gotogshared("https://github.com/SalemBalfagih");
                    },
                  ),
                  CustomSocialMedia(
                    assetName: 'lib/images/linkedin.png',
                    seconds: 2,
                    onTap: () {
                      profileController.gotogshared(
                          "https://www.linkedin.com/in/salem-mohammed-balfaqih-963a012a2");
                    },
                  ),
                  CustomSocialMedia(
                    assetName: 'lib/images/whatsapp.png',
                    seconds: 3,
                    onTap: () {
                      profileController
                          .gotogshared("https://wa.me/+967773139096");
                    },
                  ),
                  CustomSocialMedia(
                    assetName: 'lib/images/icons8-hackerrank-256.png',
                    seconds: 4,
                    onTap: () {
                      profileController.gotogshared(
                          "https://www.hackerrank.com/profile/salem_m_it_2020");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Text(
                "About Me",
                style: textTheme1.displayLarge!.copyWith(fontSize: 20),
              ),
              const CustomAboutMe(),
            ],
          ))
        ],
      ),
    );
  }
}
