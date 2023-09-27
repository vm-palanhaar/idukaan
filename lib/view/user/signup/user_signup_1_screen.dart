import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/model/user/util/user_icon.dart';
import 'package:idukaan/model/user/util/user_texts.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class UserSignup1Screen extends StatelessWidget {
  const UserSignup1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final userSignup1Key = GlobalKey<FormState>();
    return Consumer<UserCtrl>(
      builder: (context, ctrl, _) {
        return Scaffold(
          appBar: appBar(
            context: context,
            title: UserSignupText.appBarTitle,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: userSignup1Key,
              child: Container(
                margin: screenMargin(context),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(UserSignupText.title1),
                      subtitle: Text(UserSignupText.desc1),
                    ),
                    const Divider(),
                    TextFormFieldWidget(
                      prefixIcon: UserIcons.name.icon,
                      keyboardType: TextInputType.name,
                      labelText: 'First Name',
                      onFieldSubmitted: ctrl.userSignUpReq.setFirstName,
                    ),
                    TextFormFieldWidget(
                      prefixIcon: UserIcons.name.icon,
                      keyboardType: TextInputType.name,
                      labelText: 'Last Name',
                      onFieldSubmitted: ctrl.userSignUpReq.setLastName,
                    ),
                    ElevatedButtonWidget(
                      title: 'Next',
                      onPressed: () {
                        if (userSignup1Key.currentState!.validate()) {
                          context.push('/idukaan/user/signup/2');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
