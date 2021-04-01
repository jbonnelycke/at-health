import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:uuid/uuid.dart';

class ChecklistScreen extends StatefulWidget {
  static final String id = 'checklist';

  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class ChecklistListItem {
  var uuid;
  var isChecked;
  var description;

  ChecklistListItem(Uuid uuid, String description) {
    this.uuid = uuid;
    this.description = description;
  }

  String getUUID() {
    return this.uuid;
  }
}

var checklistLists = new Map();

class ChecklistInternalViewScreen extends StatefulWidget {

  static final String id = "checklist-list";

  @override
  _ChecklistInternalViewScreenState createState() => _ChecklistInternalViewScreenState();
 
}

class _ChecklistInternalViewScreenState extends State<ChecklistInternalViewScreen> {
  
  final String listUUID;
  final String listTitle;
  Map listItems = new Map();

  _ChecklistInternalViewScreenState({@required this.listUUID, @required this.listTitle}) : super();

  Future<String> createChecklistListItemModal(BuildContext context) {
    TextEditingController checklistListTitleController =
        TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6)),
          backgroundColor: Color(0xffFFD4A9),
          title: Text(
            'Create Checklist',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'RopaSans',
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          content: Container(
            height: 100,
            child: Column(
              children: [
                TextField(
                  controller: checklistListTitleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('Add Item'),
              onPressed: () {
                Navigator.of(context)
                    .pop(checklistListTitleController.text.toString());

                
                // GET LIST
                // // CALL ADDITEM
              },
            ),
          ],
        );
      }
    );
  }

  @override
  void initState() {
    super.initState();
  }

  var refreshState = false;

  void outsideStateToggle(){

    setState((){
      this.refreshState = !this.refreshState;
      this.listItems = checklistLists[this.listUUID].listItems;
    });

    print("Updating Internal Refresh State . . .");

  }

  var addButton = Positioned(
    bottom: 5,
    right: 5,
    child: ButtonTheme(
      minWidth: 64,
      height: 64,
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        onPressed: () => {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(
            color: Color(0xfff55e61)
          )
        ),
        color: Color(0xfff55e61),
        textColor: Colors.white,
        child: Text(
          "+",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white
          )
        )
      )
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Color(0xfff55e61), Color(0xffFFE4BC)]),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Column(children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 150,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 35, 10, 10),
                      color: Color(0xff5ccb88),
                      width: double.infinity,
                      height: 120,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(listTitle,
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white)),
                          ]),
                    ),
                    Positioned(
                        top: 25,
                        right: 10,
                        child: ButtonTheme(
                            minWidth: 32,
                            height: 32,
                            child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Color(0xfff55e61))),
                                color: Color(0xfff55e61),
                                textColor: Colors.white,
                                // todo
                                // replace with a nicer close icon
                                child: Text("Back",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white))))),
                  ],
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: new ListView(
                  children: listItems.values.map((checklistListItemObject) {
                  return Builder(builder: (BuildContext context) {
                    return Text(
                      checklistListItemObject.description
                    );
                  });
                }).toList()
              ))
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RaisedButton(
                          onPressed: () {
                            createChecklistListItemModal(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Color(0xfff55e61))),
                          color: Color(0xfff55e61),
                          textColor: Colors.white,
                          child: Text("New Item",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)))
                    ]))
          ])),
    ));
  }

}

class ChecklistList {
  var uuid;
  var title;
  var description;
  var listItems = new Map();

  var updateCallback;

  ChecklistList(String title, String description, Function updateCallback) {
    this.title = title;
    this.description = description;

    this.updateCallback = updateCallback;

    this.uuid = Uuid();
    // todo
    // check for existing uuid in checklistLists, if it exists, regenerate the uuid
    checklistLists[uuid] = this;

    print("Created new Checklist");
    print(title);
    print(description);

    updateCallback();
  }

  void deleteList() {
    checklistLists.remove(uuid);
    // todo
    // remove data from device
    updateCallback();
  }

  void addItem(String checklistItemString) {
    var checklistListItemUUID = Uuid();
    // todo
    // check for existing uuid in checklist listItems, if it exists, regenerate the uuid
    var checklistListItem =
        new ChecklistListItem(checklistListItemUUID, checklistItemString);
    this.listItems[checklistListItemUUID] = checklistListItem;

    updateCallback();
  }

  void removeItem(Uuid checklistItemUUID) {
    this.listItems.remove(checklistItemUUID);
    updateCallback();
  }
}

class ChecklistListItemWidget extends StatelessWidget {

  ChecklistListItemWidget({this.title, this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Test");

          /*
          Navigator.push(context, MaterialPageRoute(
            builder : (context) => ChecklistInternalViewScreen({
              title : title
            })
          ));
          */

        },
        child: Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.7, 2.0),
                  radius: 3.0,
                  colors: [Color(0xfff55e61), Color(0xff5ccb88)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(6)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text(description,
                    style: TextStyle(fontSize: 12, color: Colors.white)),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("0/x Completed",
                      style: TextStyle(fontSize: 10, color: Colors.white)),
                )
              ],
            )));
  }
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  //

  Future<String> createChecklistListModal(BuildContext context) {
    TextEditingController checklistListTitleController =
        TextEditingController();
    TextEditingController checklistListDescriptionController =
        TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6)),
          backgroundColor: Color(0xffFFD4A9),
          title: Text(
            'Create Checklist',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'RopaSans',
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          content: Container(
            height: 100,
            child: Column(
              children: [
                TextField(
                  controller: checklistListTitleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                TextField(
                  controller: checklistListDescriptionController,
                  decoration: InputDecoration(
                    hintText: '(Optional) Description',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('Create Checklist'),
              onPressed: () {
                Navigator.of(context)
                    .pop(checklistListTitleController.text.toString());

                new ChecklistList(checklistListTitleController.text,
                    checklistListDescriptionController.text,
                    this.outsideStateToggle);
              },
            ),
          ],
        );
      }
    );
  }

  @override
  void initState() {
    super.initState();
  }

  var refreshState = false;

  void outsideStateToggle(){
   
    setState(() {
      this.refreshState = !this.refreshState;
    });

    print("Updating Refresh State . . .");
    print(this.refreshState);
  }

  var addButton = Positioned(
    bottom: 5,
    right: 5,
    child: ButtonTheme(
      minWidth: 64,
      height: 64,
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        onPressed: () => {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(
            color: Color(0xfff55e61)
          )
        ),
        color: Color(0xfff55e61),
        textColor: Colors.white,
        child: Text(
          "+",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white
          )
        )
      )
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Color(0xfff55e61), Color(0xffFFE4BC)]),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Column(children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 150,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 35, 10, 10),
                      color: Color(0xff5ccb88),
                      width: double.infinity,
                      height: 120,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("My Checklists",
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white)),
                            Text("To Dos, Reminders, and More",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white))
                          ]),
                    ),
                    Positioned(
                        top: 25,
                        right: 10,
                        child: ButtonTheme(
                            minWidth: 32,
                            height: 32,
                            child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomeScreen()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    side: BorderSide(color: Color(0xfff55e61))),
                                color: Color(0xfff55e61),
                                textColor: Colors.white,
                                // todo
                                // replace with a nicer close icon
                                child: Text("X",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white))))),
                  ],
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: new ListView(
                  children: checklistLists.values.map((checklistListObject) {
                  return Builder(builder: (BuildContext context) {
                    return ChecklistListItemWidget(
                      title: checklistListObject.title,
                      description: checklistListObject.description,
                    );
                  });
                }).toList()
              ))
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RaisedButton(
                          onPressed: () {
                            createChecklistListModal(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Color(0xfff55e61))),
                          color: Color(0xfff55e61),
                          textColor: Colors.white,
                          child: Text("New Checklist",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)))
                    ]))
          ])),
    ));
  }
}


