import 'package:flutter/material.dart';
import 'package:shop/admin/addCatogory.dart';
import 'package:shop/admin/addProduct.dart';
import 'package:shop/admin/products.dart';
import 'package:shop/authontication/fireBaseAuth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'admin/catogories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Shop());
}

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AuthTest(),
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        routes: {
          '/addCatogory': (BuildContext context) => AddCatogory(),
          '/categories': (BuildContext context) => AllCatogory(),
          '/Products': (BuildContext context) => AllProduct(),
          '/addProduct': (BuildContext context) => AddProduct(),
        });
  }
}

class AuthTest extends StatefulWidget {
  @override
  _AuthTestState createState() => _AuthTestState();
}

class _AuthTestState extends State<AuthTest> {
//  TextEditingController _emailEditController = TextEditingController();
//  TextEditingController _passwordEditController = TextEditingController();
  FireBaseAuth fireBaseAuth = FireBaseAuth();

//  @override
//  void dispose() {
//    _emailEditController.dispose();
//    _passwordEditController.dispose();
//  }

  @override
  void initState() {
    super.initState();
    fireBaseAuth.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/addCatogory');
                },
                child: Text('Add Catogory'),
              ),
            ),
            ListTile(
              title: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/categories');
                },
                child: Text('My Categories'),
              ),
            ),
            ListTile(
              title: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/addProduct');
                },
                child: Text('Add Product'),
              ),
            ),
           ListTile(
             title:  RaisedButton(
               onPressed: () {
                 Navigator.of(context).pop();
                 Navigator.pushNamed(context, '/Products');
               },
               child: Text('My Products'),
             ),
           )
          ],
        ),
      ),
    );
  }
}

//home: Scaffold(
//appBar: AppBar(
//title: Text('Shop'),
//),
//body: Container(
//child: Center(
//child: Column(
//children: <Widget>[
//Text('Register'),
//SizedBox(height: 14,),
//TextField(
//controller: _emailEditController,
//keyboardType: TextInputType.emailAddress,
//decoration: InputDecoration(
//icon: Icon(Icons.email),
//hintText: 'Email'
//),
//),
//SizedBox(height: 16,),
//TextField(
//controller: _passwordEditController,
//obscureText: true,
//decoration: InputDecoration(
//icon: Icon(Icons.lock),
//hintText: 'PassWord'
//),
//),
//SizedBox(height: 19,),
//RaisedButton(onPressed: () async {
//String email = _emailEditController.text;
//String pass = _passwordEditController.text;
//var user = await fireBaseAuth.signIn(email, pass);
//print(user);
//}, child: Text('Sign In'),),
//SizedBox(height: 19,),
//RaisedButton(onPressed: () async {
//await fireBaseAuth.signOut();
//}, child: Text('Sign Out'),
//)
//],
//),
//),
//),
//),
