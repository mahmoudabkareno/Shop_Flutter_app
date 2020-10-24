import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCatogory extends StatefulWidget {
  @override
  _AddCatogoryState createState() => _AddCatogoryState();
}

class _AddCatogoryState extends State<AddCatogory> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _catogoryTitleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _catogoryTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Catogory'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _catogoryTitleController,
                  decoration: InputDecoration(
                    hintText: 'Add Catogory Title'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Title of Catogory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 17.0,),
              Container(
                  padding: EdgeInsets.only(left: 220.0),
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        FirebaseFirestore.instance
                            .collection('Categories')
                            .doc()
                            .set({
                          'categoryTitle': _catogoryTitleController.text,
                        });
                      }
                    },
                    child: Text('Save Catogory'),
              )
              ),
            ],
          )
        ));
  }
}
