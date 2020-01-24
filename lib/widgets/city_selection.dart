import 'package:flutter/material.dart';

class CitySelection extends StatefulWidget {
  @override
  _CitySelectionState createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController result = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Form(
              child: TextFormField(
                controller: result,
                decoration:
                    InputDecoration(labelText: 'City', hintText: 'yagon'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pop(context, result.text);
            },
          )
        ],
      ),
    );
  }
}
