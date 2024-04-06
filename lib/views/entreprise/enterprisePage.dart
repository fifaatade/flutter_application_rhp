import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/app_drawer.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';

class EnterprisePage extends StatefulWidget {
  const EnterprisePage({super.key});

  @override
  State<EnterprisePage> createState() => _EnterprisePageState();
}

class _EnterprisePageState extends State<EnterprisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: "Programme",
          goBack: false,
        ),
      ),
      backgroundColor: Color.fromARGB(14, 0, 0, 0),
      endDrawer: AppDrawer(),
      body: Container(),
    );
  }
}
