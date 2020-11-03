import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/services/server_demo_service.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  void initState() {
    super.initState();
    _atClientService.initClient(atSign);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //update
            Container(
              width: 500,
              height: 250,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.create, size: 70),
                      title: Text('Update ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),
                      ),
                      subtitle: ListView(
                        shrinkWrap: true,
                        children: [
                          TextField(
                            decoration:
                            InputDecoration(hintText: 'Enter Key'),
                            // TODO: Assign the key
                            onChanged: (key) {
                              _key = key;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter Value'),
                            // TODO: Assign the value
                            onChanged: (value) {
                              _value = value;
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: FlatButton(
                        child: Text('Update'),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        // TODO: Complete the onPressed function
                        onPressed: _update,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //scan
            Container(
              width: 500,
              height: 180,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.scanner, size: 70),
                      title: Text('Scan',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),
                      ),
                      subtitle: DropdownButton<String>(
                        hint: Text('Select Key'),
                        // TODO: complete these parameters
                        items: _scanItems.map(
                          (String key) {
                            return DropdownMenuItem(
                              value: key != null ? key : null,
                              child: Text(key),
                            );
                          }
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            _lookupKey = value;
                            _lookupTextFieldController.text = value;
                          });
                        },
                        value: _scanItems.length > 0
                        ? _scanItems[0] : '',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                        child: Text('Scan'),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        // TODO: Complete the onPressed function
                        onPressed: _scan,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //lookup
            Container(
              width: 500,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.list, size: 70),
                      title: Text('LookUp',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration:
                            InputDecoration(hintText: 'Enter Key'),
                            // TODO: Assign the controller
                            controller: _lookupTextFieldController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Lookup Result : ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // TODO: assign a String to the Text widget
                          Text('$_lookupValue',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                        child: Text('Lookup'),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        // TODO: complete the onPressed function
                        onPressed: _lookup,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
      List<String> scanList =
          response.map((key) => key.replaceAll('.' + conf.namespace +
              atSign, '').replaceAll(atSign + ':', '')).toList();
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

