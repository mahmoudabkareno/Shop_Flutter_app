import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _productTitleController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();
  String _SelectCategory;


  @override
  void dispose() {
    super.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    _productTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _productTitleController,
                decoration: InputDecoration(hintText: 'Product Title'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 22.0,
              ),
              TextFormField(
                controller: _productDescriptionController,
                maxLines: 10,
                decoration: InputDecoration(hintText: 'Product Description'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: _productPriceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(hintText: 'Product Price'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.2,),
              _selectCatogory(),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                onPressed: () {
                  //to check: is data eneterd or not in TextField?
                  if (_formKey.currentState.validate()) {
                    FirebaseFirestore.instance
                        .collection('Products')
                        .doc()
                        .set({
                      'productTitle': _productTitleController.text,
                      'productDescription': _productDescriptionController.text,
                      'productPrice': _productPriceController.text,
                      'categoryTitle': _SelectCategory
                    });
                  }
                },
                child: Text(
                  'Save Product',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurple,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectCatogory() {
    var caterogry = FirebaseFirestore.instance.collection('Categories').snapshots();
    return StreamBuilder(
      stream: caterogry,
      builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError){
          return Text('ERROR: ${snapshot.error}');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
        }
        return DropdownButton<String>(
            items: snapshot.data.docs.map((DocumentSnapshot document) {
              return DropdownMenuItem<String>(
                child: Text('categoryTitle'),
                value: document.data()['categoryTitle'],
              );
            }).toList(),
            value: _SelectCategory,
            onChanged: (String newValue){
              setState(() {
                _SelectCategory =newValue;
              });
            }
        );
      }
    );

  }
}