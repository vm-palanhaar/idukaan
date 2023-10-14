import 'package:flutter/material.dart';
import 'package:idukaan/view/main/business/widgets/org/org_info_ois_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';

class OrgInfoScreen extends StatefulWidget {
  const OrgInfoScreen({super.key});
  static String id = '/idukaan/business/org/id/info';

  @override
  State<OrgInfoScreen> createState() => _OrgInfoScreenState();
}

class _OrgInfoScreenState extends State<OrgInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Enterprise Info',
      ),
      body: const OrgInfoOISWidget(),
    );
  }
}
