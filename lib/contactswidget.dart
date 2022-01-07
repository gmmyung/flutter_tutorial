import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({Key? key, required this.user}) : super(key: key);
  final Contact user;

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: Row(
          children: [
            const HeroIcon(HeroIcons.userCircle, solid: true, size: 50),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.user.displayName ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16)),
                          Text(pickPhoneNum(widget.user.phones ?? []),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black54))
                        ]))),
          ],
        ));
  }
}

String pickPhoneNum(List<Item> phones) {
  if (phones.length > 1) {
    return (phones[0].value ?? '') + ' ...';
  }
  if (phones.length == 1) {
    return phones[0].value ?? '';
  } else {
    return '';
  }
}
