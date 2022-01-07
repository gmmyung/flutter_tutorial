import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'contactmanagement.dart';
import 'appbar.dart';
import 'contactswidget.dart';
import 'floatingbutton.dart';

var appName = '연락처앱';
void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('Contact access granted');
      List<Contact> contactList = await getContactfromPhone();
      contactList.sort((a, b) {
        return ((a.displayName ?? '').compareTo(b.displayName ?? ''));
      });
      setState(() {
        userInfo = contactList;
      });
    } else if (status.isDenied) {
      print('Contact access not yet granted');
      Permission.contacts.request();
    }
  }

  List<Contact> userInfo = [];
  userAdd(givenName, familyName, number) async {
    await addContact2Phone(givenName, familyName, number);
    await getPermission();
  }

  @override
  void initState() {
    super.initState();
    getPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingButton(userAdder: userAdd),
      appBar: AppBar(
        title: Text(appName),
        actions: [
          IconButton(
            icon: const HeroIcon(HeroIcons.userGroup, solid: true),
            onPressed: () {
              getPermission();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: userInfo.length,
        itemBuilder: (context, i) {
          return ContactWidget(user: userInfo[i]);
        },
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      ),
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}
