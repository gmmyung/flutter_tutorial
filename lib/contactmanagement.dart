import 'package:contacts_service/contacts_service.dart';

Future<void> addContact2Phone(
    String givenName, String familyName, String number) async {
  var newPerson = Contact();
  newPerson.givenName = givenName;
  newPerson.familyName = familyName;
  newPerson.phones = [Item(label: 'mobile', value: number)];
  await ContactsService.addContact(newPerson);
}

Future<List<Contact>> getContactfromPhone() async {
  return await ContactsService.getContacts(orderByGivenName: true);
}
