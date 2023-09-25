import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idukaan/controller/local/local_ctrl.dart';
import 'package:idukaan/controller/local/local_ctrl_mdl.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserInitKycScreen extends StatelessWidget {
  const UserInitKycScreen({super.key});

  static String salutation = 'Dear <user>,\n';
  static const String message = 'Complete your KYC to access all the features '
      'of the app and contribute to a healthy environment on the app experience.\n\n';

  static const String explainKycTitle = 'Why KYC?\n';
  static const String explainKycDesc = 'KYC stands for Know Your Customer. '
      'It is a process of verifying the identity of a customer. We require KYC '
      'to ensure that our app is used by real people and to prevent fraud and '
      'other illegal activities.\n\n';

  static const String howKycTitle = 'How KYC will contribute to a healthy '
      'environment on the app experience:\n';
  static const String howKycPoint1 =
      '\u2022 KYC will help us to identify and remove fake and fraudulent  account.\n';
  static const String howKycPoint2 =
      '\u2022 KYC will help us to prevent spam and other forms of abuse.\n';
  static const String howKycPoint3 =
      '\u2022 KYC will help us to create a more trusted and secure environment for all users.\n\n';

  static const String howToCompleteKycTitle = 'How to complete KYC:\n';
  static const String howToCompleteKycDesc =
      'To complete your KYC, you will need to provide us with some basic information, '
      'such as your name, date of birth, address and government-issued ID. You can submit '
      'your KYC information in a few simple steps.\n';

  static const String thanks = 'Thank you for your cooperation!\n\n';
  static const String regards = 'Regards,\nPalanhaar Team\n';

  @override
  Widget build(BuildContext context) {
    LocalCtrl localCtrl = Provider.of<LocalCtrl>(context, listen: false);
    UserCtrl userCtrl = Provider.of<UserCtrl>(context, listen: false);
    salutation = salutation.replaceAll(
        "<user>", localCtrl.appKeys[AppKey.firstName.key]!);
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Know Your Customer (KYC)',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Column(
            children: <Widget>[
              ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: salutation,
                      fontWeight: FontWeight.bold,
                    ),
                    const Text(message),
                    const TextWidget(
                      text: explainKycTitle,
                      fontWeight: FontWeight.bold,
                    ),
                    const Text(explainKycDesc),
                    const TextWidget(
                      text: howKycTitle,
                      fontWeight: FontWeight.bold,
                    ),
                    const Text(howKycPoint1),
                    const Text(howKycPoint2),
                    const Text(howKycPoint3),
                    const TextWidget(
                      text: howToCompleteKycTitle,
                      fontWeight: FontWeight.bold,
                    ),
                    const Text(howToCompleteKycDesc),
                    const TextWidget(
                      text: thanks,
                      fontWeight: FontWeight.bold,
                    ),
                    const TextWidget(
                      text: regards,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.perm_identity),
                  title: Text('Continue KYC'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Logout'),
                  onTap: () async {
                    context.replace('/idukaan/user');
                    await userCtrl.postUserLogoutApi(context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
