import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/services/server_demo_service.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

  ChecklistListItem(Uuid uuid, String description){
    this.uuid = uuid;
    this.description = description;
  }

  String getUUID(){
    return this.uuid;
  }
}

var checklistLists = new Map();

class ChecklistList {
  var uuid;
  var title;
  var description;
  var listItems = new Map();

  ChecklistList(String title, String description){
    this.title = title;
    this.description = description;

    this.uuid = Uuid();
    // todo
    // check for existing uuid in checklistLists, if it exists, regenerate the uuid
    checklistLists[uuid] = this;

    print("Created new Checklist");
    print(title);
    print(description);
  }

  void deleteList(){
    checklistLists.remove(uuid);
    // todo
    // remove data from device
  }

  void addItem(String checklistItemString){
    var checklistListItemUUID = Uuid();
    // todo
    // check for existing uuid in checklist listItems, if it exists, regenerate the uuid
    var checklistListItem = new ChecklistListItem(checklistListItemUUID, checklistItemString);
    this.listItems[checklistListItemUUID] = checklistListItem;
  }

  void removeItem(Uuid checklistItemUUID){
    this.listItems.remove(checklistItemUUID);
  }
}

class ChecklistListItemWidget extends StatelessWidget {

  ChecklistListItemWidget({this.title, this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: (){
          print("Test");
        },
        child : Container(
            margin: EdgeInsets.fromLTRB(5,0,5,10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.7, 2.0),
                  radius : 3.0,
                  colors: [
                    Color(0xfff55e61),
                    Color(0xff5ccb88)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(6)),
                boxShadow : [
                  BoxShadow(
                      color : Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset : Offset(0, 2)
                  )
                ]
            ),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style : TextStyle(
                        fontSize : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                ),
                Text(description,
                    style : TextStyle(
                        fontSize : 12,
                        color: Colors.white
                    )
                ),
                Container(
                  margin : EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child : Text("0/x Completed",

                      style : TextStyle(
                          fontSize : 10,
                          color: Colors.white
                      )
                  ),
                )
              ],
            )
        )
    );
  }
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  // TODO: Instantiate variables
  //update
  String _key;
  String _value;

  // lookup
  TextEditingController _lookupTextFieldController = TextEditingController();
  String _lookupKey;
  String _lookupValue = '';

  // scan
  List<String> _scanItems = List<String>();

  // service
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  //

  Future<String> createChecklistListModal(BuildContext context) {
    TextEditingController checklistListTitleController = TextEditingController();
    TextEditingController checklistListDescriptionController = TextEditingController();
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
                  Navigator.of(context).pop(checklistListTitleController.text.toString());
                  new ChecklistList(checklistListTitleController.text,  checklistListDescriptionController.text);
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  var addButton = Positioned(
      bottom : 5,
      right : 5,
      child : ButtonTheme(
          minWidth : 64,
          height : 64,
          child : RaisedButton(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              onPressed: () => {},
              shape : RoundedRectangleBorder(
                  borderRadius : BorderRadius.circular(40),
                  side : BorderSide(color : Color(0xfff55e61))
              ),
              color : Color(0xfff55e61),
              textColor: Colors.white,
              child : Text("+",
                  style : TextStyle(
                      fontSize : 24,
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
                      colors: [Color(0xfff55e61), Color(0xffFFE4BC)]
                  ),
                  boxShadow : [
                    BoxShadow(
                        color : Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset : Offset(0, 3)
                    )
                  ]
              ),
              child: Column(
                  children: [
                    Container(
                        margin : EdgeInsets.fromLTRB(0, 0, 0, 0),
                        height : 150,
                        width : double.infinity,
                        child : Stack(
                          children: <Widget>[
                            Container(
                              padding : EdgeInsets.fromLTRB(10, 35, 10, 10),
                              color : Color(0xff5ccb88),
                              width : double.infinity,
                              height : 120,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children : [
                                      Text("My Checklists",
                                          style : TextStyle(
                                              fontSize : 26,
                                              color: Colors.white
                                          )
                                      ),
                                      Text("To Dos, Reminders, and More",
                                          style : TextStyle(
                                              fontSize : 12,
                                              color: Colors.white
                                          )
                                      )
                                  ]
                              ),
                            ),
                            Positioned(
                                top : 25,
                                right : 10,
                                child : ButtonTheme(
                                    minWidth : 32,
                                    height : 32,
                                    child : RaisedButton(
                                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              new MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      HomeScreen()));
                                        },
                                        shape : RoundedRectangleBorder(
                                            borderRadius : BorderRadius.circular(40),
                                            side : BorderSide(color : Color(0xfff55e61))
                                        ),
                                        color : Color(0xfff55e61),
                                        textColor: Colors.white,
                                        // todo
                                        // replace with a nicer close icon
                                        child : Text("X",
                                            style : TextStyle(
                                                fontSize : 12,
                                                color: Colors.white
                                            )
                                        )
                                    )
                                )
                            ),
                          ],
                        )
                    ),
                    Expanded(
                        child: Container(
                            padding : EdgeInsets.fromLTRB(5, 0, 5, 10),

                            child : new ListView(
                                children: checklistLists.values.map((checklistListObject) {
                                  return Builder(
                                      builder : (BuildContext context){
                                        return ChecklistListItemWidget(
                                          title : checklistListObject.title,
                                          description: checklistListObject.description,
                                        );
                                      }
                                  );
                                }).toList()
                                /*
                                children : [1,2,3,4,5,6].map((i) {
                                  return Builder(
                                    builder : (BuildContext context){
                                      return checklistListItem;
                                    }
                                  );
                                }).toList()
                                */
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children : [
                            RaisedButton(
                              onPressed: () {
                                createChecklistListModal(context);
                              },
                              shape : RoundedRectangleBorder(
                                  borderRadius : BorderRadius.circular(5),
                                  side : BorderSide(color : Color(0xfff55e61))
                              ),
                              color : Color(0xfff55e61),
                              textColor: Colors.white,
                              child : Text("New Checklist",
                                  style : TextStyle(
                                      fontSize : 14,
                                      color: Colors.white
                                  )
                              )
                          )
                        ]
                      )
                    )
                  ]
              )
          ),
        )
    );
  }

  // TODO: add the _scan, _update, and _lookup methods
  _update() async {
    if (_key != null && _value != null) {
      AtKey pair = AtKey();
      pair.key = _key;
      pair.sharedWith = atSign;
      await _atClientService.put(pair, _value);
    }
  }

  _scan() async {
    List<String> response = await _atClientService.getKeys(sharedBy: atSign);
    if (response.length > 0) {
      List<String> scanList = response
          .map((key) => key
          .replaceAll('.' + conf.namespace + atSign, '')
          .replaceAll(atSign + ':', ''))
          .toList();
      setState(() {
        _scanItems = scanList;
      });
    }
  }

  _lookup() async {
    if (_lookupKey != null) {
      AtKey lookup = AtKey();
      lookup.key = _lookupKey;
      lookup.sharedWith = atSign;
      String response = await _atClientService.get(lookup);
      if (response != null) {
        setState(() {
          _lookupValue = response;
        });
      }
    }
  }
}
