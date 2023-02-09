import 'package:flutter/material.dart';

class Privacy_Policy extends StatelessWidget {
  const Privacy_Policy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Policy'),
      ),
      body: const SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
          child: Text(
            "Privacy Policy \n\n Ali Ahmad built the EZ TTANSLATOR app as a Free app. This SERVICE is provided by Ali Ahmad at no cost and is intended for use as is.This page is used to inform visitors regarding my policies with the collection,use and disclosure of Personal Information if anyone decided to use my Service.If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at EZ TTANSLATOR unless otherwise defined in this Privacy Policy."
            '\nInformation Collection and Use For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way. The app does use third-party services that may collect information used to identify you. \nLink to the privacy policy of third-party service providers used by the app: \n Google Play Services \n'
            "\n Log Data \n\n I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics. \n "
            "\n Security \n\n I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security. \n "
            "\n Children’s Privacy \n\n These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions.",
            textAlign: TextAlign.justify,
          )),
    );
  }
}
