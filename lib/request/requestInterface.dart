import 'package:flutter/material.dart';
import 'userModel.dart';

class RequestCard extends StatefulWidget {
  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  DateTime dateTime;
  List<Person> persons = [
    Person(
        name: 'Bill Will',
        profileImg: 'images/logo.png',
        bio: DateTime.now().toString()),
    Person(
        name: 'Andy Smith', profileImg: 'images/logo.png', bio: "UI Designer"),
    Person(
        name: 'Creepy Story',
        profileImg: 'images/logo.png',
        bio: "Software Tester"),

    Person(
        name: 'Abhay Singh',
        profileImg: 'images/logo.png',
        bio: 'Software Developer')
    // Person(name: 'Abhay', bio: "Developer",),
  ];

  Widget personDetailsCard(Person) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10.0, bottom: 10.0),
        child: Card(
          color: Color(0xff5AC6AC),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Person.profileImg)))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Person.name,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      Person.bio,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerLeft,
//                  color: Colors.greenAccent,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Ink(
                        decoration: ShapeDecoration(shape: CircleBorder()),
                        child: IconButton(
                          icon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          //color: Colors.white,
                          iconSize: 28.0,
                          onPressed: null,
                        ),
                      ),
                      Ink(
                        decoration: ShapeDecoration(shape: CircleBorder()),
                        child: IconButton(
                          onPressed: () => Text("Clicked"),
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.redAccent,
                          ),
                          color: Colors.red,
                          iconSize: 28.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff07575b),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, size: 35, color: Colors.black),
                Text(
                  'Appointment Requests',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.notifications_none, size: 35, color: Colors.white)
              ],
            ),
            Column(
                children: persons.map((p) {
              return personDetailsCard(p);
            }).toList())
          ],
        ),
      ),
    );
  }
}
