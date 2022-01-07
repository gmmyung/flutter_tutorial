import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class MyFloatingButton extends StatefulWidget {
  const MyFloatingButton({Key? key, this.userAdder}) : super(key: key);
  final dynamic userAdder;
  @override
  _MyFloatingButtonState createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  var a = 0;

  @override
  Widget build(BuildContext context) {
    onCancel() {}
    onOK(givenName, familyName, number) {
      setState(() {
        widget.userAdder(givenName, familyName, number);
      });
    }

    return FloatingActionButton(
        child: const HeroIcon(HeroIcons.userAdd, solid: true),
        onPressed: () {
          floatingButtonHandler(context, onCancel, onOK);
        });
  }
}

floatingButtonHandler(context, onCancel, onOK) {
  showDialog(
      context: context,
      builder: (context) {
        return FloatingButtonDialog(onCancel: onCancel, onOK: onOK);
      });
}

class FloatingButtonDialog extends StatefulWidget {
  const FloatingButtonDialog({Key? key, this.onCancel, this.onOK})
      : super(key: key);
  final dynamic onCancel;
  final dynamic onOK;
  @override
  State<FloatingButtonDialog> createState() => _FloatingButtonDialogState();
}

class _FloatingButtonDialogState extends State<FloatingButtonDialog> {
  var inputFirstName = '';
  var inputGivenName = '';
  var inputNumber = '';
  var wrongFirstName = false;
  var wrongGivenName = false;
  var wrongNumber = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
      height: 310,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'First Name'),
              onChanged: (text) {
                inputFirstName = text;
              },
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Last Name'),
              onChanged: (text) {
                inputGivenName = text;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              onChanged: (text) {
                inputNumber = text;
              },
            ),
            const SizedBox(height: 8),
            Text(
              ((wrongFirstName | wrongNumber | wrongGivenName)
                  ? "Enter Valid Contact Info"
                  : ''),
              style: const TextStyle(color: Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      widget.onCancel();
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      if ((inputFirstName != '') &
                          (inputNumber != '') &
                          (inputGivenName != '')) {
                        widget.onOK(
                            inputFirstName, inputGivenName, inputNumber);
                        print(inputFirstName + inputGivenName);
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          wrongFirstName = (inputFirstName == '');
                          wrongGivenName = (inputGivenName == '');
                          wrongNumber = (inputNumber == '');
                        });
                      }
                    },
                    child: const Text('OK'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
