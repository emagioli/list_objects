import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Contacts list demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    contacts.add(new Contact(
        name: "João Pedro",
        phoneNumber: "22 99912-0821",
        type: ContactType.CELLULAR));
    contacts.add(new Contact(
        name: "Igor Machado",
        phoneNumber: "22 99812-0295",
        type: ContactType.WORK));
    contacts.add(new Contact(
        name: "Vó do Igor",
        phoneNumber: "22 99912-0217",
        type: ContactType.HOME));
    contacts.add(new Contact(
        name: "Vitor Gomes",
        phoneNumber: "22 96917-7584",
        type: ContactType.CELLULAR));
    contacts.add(new Contact(
        name: "Nicolly Souza",
        phoneNumber: "22 93742-1032",
        type: ContactType.HOME));
    contacts.add(new Contact(
        name: "Flavio Carneiro",
        phoneNumber: "22 99273-1742",
        type: ContactType.CELLULAR));
    contacts.add(new Contact(
        name: "Enzo Magioli",
        phoneNumber: "22 99912-0267",
        type: ContactType.CELLULAR));
    contacts.add(new Contact(
        name: "Julio Cesar",
        phoneNumber: "21 93715-0153",
        type: ContactType.WORK));
    contacts.add(new Contact(
        name: "Clair Netto",
        phoneNumber: "22 99915-0227",
        type: ContactType.FAVORITE));

    contacts.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              child: ContactHelper.getIconByContactType(contact.type),
              backgroundColor: Colors.blue[200],
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            trailing: IconButton(
              icon: Icon(Icons.call),
              onPressed: () => {},
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: contacts.length,
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  final ContactType type;

  Contact({required this.name, required this.phoneNumber, required this.type});
}

enum ContactType { CELLULAR, WORK, FAVORITE, HOME }

class ContactHelper {
  static Icon getIconByContactType(ContactType type) {
    switch (type) {
      case ContactType.CELLULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContactType.WORK:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContactType.FAVORITE:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContactType.HOME:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
