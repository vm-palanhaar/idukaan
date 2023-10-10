import 'package:flutter/material.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/model/user/util/user_icon.dart';
import 'package:idukaan/model/user/util/user_texts.dart';
import 'package:idukaan/view/init/init_screen.dart';
import 'package:idukaan/view/init/init_view.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/textformfield_widget.dart';
import 'package:idukaan/view/widgets/list_tile_error_widget.dart';
import 'package:provider/provider.dart';

class UserSignup3Screen extends StatefulWidget {
  const UserSignup3Screen({super.key});
  static String id = '/idukaan/user/signup/3';

  @override
  State<UserSignup3Screen> createState() => _UserSignup3ScreenState();
}

class _UserSignup3ScreenState extends State<UserSignup3Screen> {
  void _successResponse({
    required String firstName,
    required String message,
  }) {
    Navigator.pushNamedAndRemoveUntil(
        context, InitScreen.id, ModalRoute.withName(InitView.id));
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Hi $firstName,'),
        content: Text(message),
        actions: const [],
      ),
    );
  }

  void _failedResponse({
    required String firstName,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Hi $firstName,'),
        content: Text(message),
        actions: const [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userSignup3Key = GlobalKey<FormState>();
    return Consumer<UserCtrl>(
      builder: (context, ctrl, _) {
        return Scaffold(
          appBar: appBar(
            context: context,
            title: UserSignupText.appBarTitle,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: userSignup3Key,
              child: Container(
                margin: screenMargin(context),
                child: Column(
                  children: [
                    if (ctrl.userSignUpRes != null &&
                        ctrl.userSignUpRes!.userFObj != null)
                      Card(
                        child: Column(
                          children: [
                            if (ctrl
                                .userSignUpRes!.userFObj!.firstName.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'First Name',
                                subtitle:
                                    ctrl.userSignUpRes!.userFObj!.firstName,
                              ),
                            if (ctrl
                                .userSignUpRes!.userFObj!.lastName.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'Last Name',
                                subtitle:
                                    ctrl.userSignUpRes!.userFObj!.lastName,
                              ),
                            if (ctrl
                                .userSignUpRes!.userFObj!.contactNo.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'Contact Number',
                                subtitle:
                                    ctrl.userSignUpRes!.userFObj!.contactNo,
                              ),
                            if (ctrl
                                .userSignUpRes!.userFObj!.username.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'Username',
                                subtitle:
                                    ctrl.userSignUpRes!.userFObj!.username,
                              ),
                            if (ctrl.userSignUpRes!.userFObj!.email.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'Email',
                                subtitle: ctrl.userSignUpRes!.userFObj!.email,
                              ),
                            if (ctrl
                                .userSignUpRes!.userFObj!.password.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'Password',
                                subtitle:
                                    ctrl.userSignUpRes!.userFObj!.password,
                              ),
                          ],
                        ),
                      ),
                    const ListTile(
                      title: Text(UserSignupText.title3),
                      subtitle: Text(UserSignupText.desc3),
                    ),
                    const Divider(),
                    TextFormFieldWidget(
                      prefixIcon: UserIcons.username.icon,
                      keyboardType: TextInputType.name,
                      labelText: 'Username',
                      onFieldSubmitted: ctrl.userSignUpReq.setUsername,
                    ),
                    TextFormFieldWidget(
                      prefixIcon: UserIcons.pwd.icon,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      labelText: 'Password',
                      onFieldSubmitted: ctrl.userSignUpReq.setPwd,
                    ),
                    ElevatedButtonWidget(
                      title: 'Next',
                      onPressed: () async {
                        if (userSignup3Key.currentState!.validate()) {
                          await ctrl.postUserSignupApi(
                            context: context,
                          );
                          if (ctrl.userSignUpRes != null) {
                            if (ctrl.userSignUpRes!.userSObj != null) {
                              _successResponse(
                                firstName:
                                    ctrl.userSignUpRes!.userSObj!.firstName,
                                message: ctrl.userSignUpRes!.message,
                              );
                              // set user signup response obj NULL
                              ctrl.userSignUpRes = null;
                            } else if (ctrl.userSignUpRes!.userFObj != null) {
                              _failedResponse(
                                firstName: ctrl.userSignUpReq.getFirstName,
                                message: ctrl.userSignUpRes!.message,
                              );
                            }
                          }
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
