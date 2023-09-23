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

class UserSignup2Screen extends StatelessWidget {
  const UserSignup2Screen({super.key});

  String? validatorContactNo(String? value) {
    if (value!.isEmpty) {
      return 'Contact Number !';
    } else if (value.length != 10) {
      return 'Contact Number should have 10 digits !';
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email !';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final userSignup2Key = GlobalKey<FormState>();
    return Consumer<UserCtrl>(
      builder: (context, ctrl, _) {
        return Scaffold(
          appBar: appBar(
            context: context,
            title: UserSignupText.appBarTitle,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: userSignup2Key,
              child: Container(
                margin: screenMargin(context),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(UserSignupText.title2),
                      subtitle: Text(UserSignupText.desc2),
                    ),
                    const Divider(),
                    TextFormFieldWidget(
                      prefixIcon: UserIcon.contactNo.icon,
                      keyboardType: TextInputType.number,
                      labelText: 'Contact Number',
                      validator: validatorContactNo,
                      onFieldSubmitted: ctrl.userSignUpReq.setContactNo,
                    ),
                    TextFormFieldWidget(
                      prefixIcon: UserIcon.mail.icon,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email',
                      validator: validatorEmail,
                      onFieldSubmitted: ctrl.userSignUpReq.setEmail,
                    ),
                    ElevatedButtonWidget(
                      title: 'Next',
                      onPressed: () {
                        if (userSignup2Key.currentState!.validate()) {
                          context.push('/idukaan/user/signup/3');
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
