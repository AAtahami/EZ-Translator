import 'package:flutter/material.dart';

class terms_conditoins extends StatelessWidget {
  const terms_conditoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: const SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
          child: Text(
            "Terms & Conditions "
            "By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to [Developer/Company name]."
            "[Developer/Company name] is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for."
            "The EZ Translator app stores and processes personal data that you have provided to us, to provide [my/our] Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the EZ Translator app won’t work properly or at all.",
            textAlign: TextAlign.justify,
          )),
    );
  }
}
