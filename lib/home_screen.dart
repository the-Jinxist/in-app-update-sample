import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_updates_sample/services/update_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    _startUpdateService();
  }

  Future<void> _startUpdateService() async {
    try {
      //This feature is only available on the Android OS
      //As specified above.

      if (Platform.isAndroid) {
        await UpdateService.startImmediateUpdate();
      }
    } catch (e) {
      //Your preferred method of showing the user erros
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("In-app update sample")),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(child: Text("Home")),
      ),
    );
  }
}
