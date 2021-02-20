import 'package:flutter/material.dart';
import 'package:mobileapp/components/bottom_navigation.dart';
import 'package:mobileapp/screens/message/component/body.dart';
import '../../enum.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
        automaticallyImplyLeading: false,
      ),
      body: MessageBody(),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.chat,),
    );
  }
}