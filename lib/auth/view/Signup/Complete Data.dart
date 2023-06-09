import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:es2al/MainPage/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../chat/data/Globals.dart';

class CompleteData extends StatefulWidget {
  int typeOfuser;
  int google;

  CompleteData(this.typeOfuser, this.google);

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  late bool isdoctor;
  late bool google;
    bool isSecret = true;
  String _dropDownValue = "1";
  String masters = "As";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController iDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    isdoctor = widget.typeOfuser == 1 ? true : false;
    google = widget.google == 1 ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff124559),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Stack(
          children: [
            const Positioned(
              width: 336,
              height: 241,
              left: 50,
              child: Image(image: AssetImage("assets/images/SignUP.png")),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 120, left: 30, right: 30),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(217, 217, 217, 0.8),
                    Color.fromRGBO(217, 217, 217, 0.6),
                  ]),
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Please enter first name text';
                            }
                            return null;
                          },
                          controller: firstNameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon:
                                const Icon(Icons.perm_identity_outlined),
                            hintText: "First Name",
                            hintStyle: const TextStyle(
                                color: Color(0xff124559), fontSize: 15),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please enter last name text';
                              }
                              return null;
                          },
                          controller: lastNameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon:
                                const Icon(Icons.perm_identity_outlined),
                            hintText: "last Name",
                            hintStyle: const TextStyle(
                                color: Color(0xff124559), fontSize: 15),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Please enter phone number text';
                            }
                            return null;
                          },
                          controller: phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: const Icon(Icons.phone_enabled),
                            hintText: "Phone",
                            hintStyle: const TextStyle(
                                color: Color(0xff124559), fontSize: 15),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        isdoctor
                            ? Container()
                            : TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Please enter your id';
                            }
                            return null;
                          },
                                controller: iDController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon:
                                      const Icon(Icons.account_circle_outlined),
                                  hintText: "ID",
                                  hintStyle: const TextStyle(
                                      color: Color(0xff124559), fontSize: 15),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Color(0xff124559))),
                                ),
                              ),
                        isdoctor
                            ? Container()
                            : SizedBox(
                                height: 15,
                              ),
                        isdoctor
                            ? Container(
                               padding: const EdgeInsets.symmetric(horizontal: 5),
                               decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                               child: DropdownButton(
                                 underline: null,
                                 items: const [
                                    DropdownMenuItem(value: "As",child: Text("AS"),),
                                    DropdownMenuItem(value: "BS",child: Text("BS"),),
                                    DropdownMenuItem(value: "MS",child: Text("MS"),),
                                    DropdownMenuItem(value: "M.D",child: Text("M.D"),),
                                    DropdownMenuItem(value: "PhD",child: Text("PhD"),),
                                  ],
                                 isExpanded: true,
                                 hint: const Text("Select Masters"),
                                 value:  masters,
                                 onChanged: (String? masterSelect){
                                   if(masterSelect is String){ setState(() { masters = masterSelect;});}
                                 },
                                  ),
                        )
                            : Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: DropdownButton(
                                  items: const [
                                    DropdownMenuItem(
                                        value: "1",
                                        child: Text("level 1")),
                                    DropdownMenuItem(
                                        value: "2",
                                        child: Text("level 2")),
                                    DropdownMenuItem(
                                        value: "3",
                                        child: Text("level 3")),
                                    DropdownMenuItem(
                                        value: "4",
                                        child: Text("level 4")),
                                  ],
                                  iconSize: 30,
                                  value: _dropDownValue,
                                  hint: const Text(
                                    "Select level",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black),
                                  isExpanded: true,
                                  onChanged: dropDownFun,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        google
                            ? Container()
                            : TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains("@") || !value.contains(".com")) {
                              return '*Please enter valid email';
                            }
                            return null;
                          },
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon:
                                      const Icon(Icons.perm_identity_outlined),
                                  hintText: "Email",
                                  hintStyle: const TextStyle(
                                      color: Color(0xff124559), fontSize: 15),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Color(0xff124559))),
                                ),
                              ),
                        google
                            ? Container()
                            : SizedBox(
                                height: 15,
                              ),
                        google
                            ? Container()
                            : TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 8) {
                              return '*Please enter 8 character at least';
                            }
                            return null;
                          },
                                controller: passwordController,
                                obscureText: isSecret,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon:  IconButton(
                                      onPressed: (){
                                        isSecret= !isSecret;
                                        setState((){});
                                      },
                                      icon: Icon(isSecret? Icons.visibility:Icons.visibility_off, color: Colors.black, )
                                  ),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                      color: Color(0xff124559), fontSize: 15),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Color(0xff124559))),
                                ),
                              ),
                        google
                            ? Container()
                            : SizedBox(
                                height: 15,
                              ),
                        ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xff124559),
                              fixedSize: const Size(174, 35),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                            onPressed: () async {
                              if (_validation()) {
                                await _saveDataAndNavigteToDashBoard();
                              }
                            },
                            child: const Text(
                              "Create account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
                left: 55,
                top: 40,
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  void dropDownFun(String? levelSelected) {
    if (levelSelected is String) {
      setState(() {
        _dropDownValue = levelSelected;
      });
    }
  }

  bool _validation() {

    if(_formKey.currentState!.validate()){
      return true;
    }
    return false;
  }

  Future<void> _saveDataAndNavigteToDashBoard() async {
    //save to firebase and provider
    await _saveInformationToFireBase().then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ));
    });
    //go to dashboard
  }

  Future<void> _saveInformationToFireBase() async {
    Map<String, dynamic> map = Map();

    map['firstName'] = firstNameController.text;
    map['lastName'] = lastNameController.text;
    map['phone'] = phoneController.text;
    if (google) {
      map['id'] = FirebaseAuth.instance.currentUser?.uid;
      map['email'] = FirebaseAuth.instance.currentUser?.email;
    } else {
      await _SignInWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((value) {
        map['id'] = FirebaseAuth.instance.currentUser?.uid;
        print("sssssssssssssssss ${FirebaseAuth.instance.currentUser?.uid}");
        map['email'] = emailController.text;
      });
    }
    if (isdoctor) {
      map['master'] = masters;
      map['type'] = 1;
    } else {
      map['studentId'] = iDController.text;
      map['level'] = _dropDownValue;
      map['type'] = 0;
      map['courses'] = [];
    }

    //save data

    await FirebaseFirestore.instance
        .collection("Users")
        .doc("${map['id']}")
        .set(map)
        .then((value) {
      Globals.user = map;
      if (isdoctor) {
        Globals.typeOfUsers = 1;
      } else {
        Globals.typeOfUsers = 0;
      }
      Globals.currentScreen = 0;
      Globals.currentScreenIndex = 0;
    });
  }

  Future<void> _SignInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

