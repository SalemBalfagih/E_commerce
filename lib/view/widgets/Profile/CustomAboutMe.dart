import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';

class CustomAboutMe extends StatelessWidget {
  const CustomAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.27,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Text('''
I am a mobile application developer using Flutter, 
and I obtained  a bachelor's degree in Information Technology. 
I have a passion for developing applications 
and de live ring innova tive sol utions Using the latest technologies.
I always strive to stay updated with the latest developments 
in information technology and applications. 
I continuously seek to improve my skills and develop myself by exploring educational resources 
and participating in training courses. My passion for learning 
and continuous improvement drives me to deliver the best in every project I work on.''',
              style: textTheme1.bodyMedium),
        ],
      ),
    );
  }
}
