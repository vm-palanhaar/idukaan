import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/model/user/util/user_icon.dart';
import 'package:idukaan/model/user/util/user_texts.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/text_form_field_widget.dart';
import 'package:idukaan/view/widgets/list_tile_error_widget.dart';
import 'package:provider/provider.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  void _successResponseUserVerified({
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    context.pop('/idukaan/user');
    context.replace('/idukaan/dashboard');
  }

  void _successResponseUserNotVerified({
    required String firstName,
    required String message,
  }) {
    context.pop('/idukaan/user');
    context.replace('/idukaan/user/init-kyc');
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
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Hi User,'),
        content: Text(message),
        actions: const [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userLoginKey = GlobalKey<FormState>();
    return Consumer<UserCtrl>(
      builder: (context, ctrl, _) {
        return Scaffold(
          appBar: appBar(
            context: context,
            title: UserLoginText.appBarTitle,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: userLoginKey,
              child: Container(
                margin: screenMargin(context),
                child: Column(
                  children: [
                    if (ctrl.userLoginRes != null &&
                        ctrl.userLoginRes!.userFObj != null)
                      Card(
                        child: Column(
                          children: [
                            ListTileErrorWidget(
                              title: 'Attention Required',
                              subtitle: ctrl.userLoginRes!.message,
                            ),
                            if (ctrl
                                .userLoginRes!.userFObj!.username.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'Username',
                                subtitle: ctrl.userLoginRes!.userFObj!.username,
                              ),
                            if (ctrl
                                .userLoginRes!.userFObj!.password.isNotEmpty)
                              ListTileErrorWidget(
                                title: 'Password',
                                subtitle: ctrl.userLoginRes!.userFObj!.password,
                              ),
                          ],
                        ),
                      ),
                    const ListTile(
                      title: Text(UserLoginText.title),
                      subtitle: Text(UserLoginText.desc),
                    ),
                    const Divider(),
                    TextFormFieldWidget(
                      prefixIcon: UserIcons.username.icon,
                      keyboardType: TextInputType.name,
                      labelText: 'Username',
                      onFieldSubmitted: ctrl.userLoginReq.setUsername,
                    ),
                    TextFormFieldWidget(
                      prefixIcon: UserIcons.pwd.icon,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      labelText: 'Password',
                      onFieldSubmitted: ctrl.userLoginReq.setPwd,
                    ),
                    ElevatedButtonWidget(
                      title: 'Login',
                      onPressed: () async {
                        if (userLoginKey.currentState!.validate()) {
                          await ctrl.postUserLoginApi(
                            context: context,
                          );
                          if (ctrl.userLoginRes != null) {
                            if (ctrl.userLoginRes!.userSObj != null) {
                              if (ctrl.userLoginRes!.userSObj!.isVer) {
                                _successResponseUserVerified(
                                  message: ctrl.userLoginRes!.message,
                                );
                                //TODO: re-direct to main home page
                              } else {
                                _successResponseUserNotVerified(
                                  firstName:
                                      ctrl.userLoginRes!.userSObj!.firstName,
                                  message: ctrl.userLoginRes!.message,
                                );
                              }
                            } else if (ctrl.userLoginRes!.userFObj != null) {
                              _failedResponse(
                                message: ctrl.userLoginRes!.message,
                              );
                            }
                          }
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Having trouble logging in?'),
                        ),
                      ],
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
