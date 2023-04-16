import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manav_s_application6/core/app_export.dart';

import '../../core/utils/color_constant.dart';
import '../edit.dart';

class K2Screen extends StatefulWidget {
  const K2Screen({Key? key}) : super(key: key);

  @override
  State<K2Screen> createState() => _K2ScreenState();
}

class _K2ScreenState extends State<K2Screen> {
  DocumentSnapshot? _deletedDocument;
  DocumentSnapshot? _deletedDocument1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.blue500,
        title: Text("Employee Deatils"),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('current').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('previous')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      // Both collections are empty
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgGroup5363,
                            height: getVerticalSize(
                              218,
                            ),
                            width: getHorizontalSize(
                              261,
                            ),
                          ),
                          Text('No employees records found.'),
                        ],
                      ));
                    }

                    return Column(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: ColorConstant.gray100,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Current Employees",
                                  style: TextStyle(
                                      color: ColorConstant.blue500,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('current')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('No records found.'));
                              }
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot document =
                                      snapshot.data!.docs[index];
                                  return Dismissible(
                                    key: Key(document.id),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) {
                                      _deletedDocument = document;
                                      FirebaseFirestore.instance
                                          .collection('current')
                                          .doc(document.id)
                                          .delete();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Employee data has been deleted."),
                                        action: SnackBarAction(
                                          label: "Undo",
                                          onPressed: () {
                                            if (_deletedDocument != null) {
                                              Map<String, dynamic> data =
                                                  _deletedDocument!.data()
                                                      as Map<String, dynamic>;
                                              FirebaseFirestore.instance
                                                  .collection('current')
                                                  .doc(_deletedDocument!.id)
                                                  .set(data);
                                            }
                                          },
                                        ),
                                      ));
                                    },
                                    background: Container(
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.delete,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Edit(documentId: document.id),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${document['name']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          // SizedBox(height: 3),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('${document['role']}',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                          // SizedBox(height: 3),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('${document['tody']}',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            height: 1,
                                            color: ColorConstant.gray300,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: ColorConstant.gray100,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Previous Employees",
                                  style: TextStyle(
                                      color: ColorConstant.blue500,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('previous')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot document =
                                      snapshot.data!.docs[index];
                                  return Dismissible(
                                    key: Key(document.id),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) {
                                      _deletedDocument1 = document;
                                      FirebaseFirestore.instance
                                          .collection('previous')
                                          .doc(document.id)
                                          .delete();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Employee data has been deleted."),
                                        action: SnackBarAction(
                                          label: "Undo",
                                          onPressed: () {
                                            if (_deletedDocument1 != null) {
                                              Map<String, dynamic> data =
                                                  _deletedDocument1!.data()
                                                      as Map<String, dynamic>;
                                              FirebaseFirestore.instance
                                                  .collection('previous')
                                                  .doc(_deletedDocument1!.id)
                                                  .set(data);
                                            }
                                          },
                                        ),
                                      ));
                                    },
                                    background: Container(
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.delete,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Edit(documentId: document.id),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${document['name']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          // SizedBox(height: 3),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('${document['role']}',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                          // SizedBox(height: 3),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                '${document['tody']} - ${document['nodate']}',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            height: 1,
                                            color: ColorConstant.gray300,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: ColorConstant.gray100,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Swipe Left To delete",
                                  style: TextStyle(
                                      color: ColorConstant.gray500,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }
            return Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: ColorConstant.gray100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Current Employees",
                          style: TextStyle(
                              color: ColorConstant.blue500, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('current')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No records found.'));
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          return Dismissible(
                            key: Key(document.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              _deletedDocument = document;
                              FirebaseFirestore.instance
                                  .collection('current')
                                  .doc(document.id)
                                  .delete();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Employee data has been deleted."),
                                action: SnackBarAction(
                                  label: "Undo",
                                  onPressed: () {
                                    if (_deletedDocument != null) {
                                      Map<String, dynamic> data =
                                          _deletedDocument!.data()
                                              as Map<String, dynamic>;
                                      FirebaseFirestore.instance
                                          .collection('current')
                                          .doc(_deletedDocument!.id)
                                          .set(data);
                                    }
                                  },
                                ),
                              ));
                            },
                            background: Container(
                              color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Icon(Icons.delete, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Edit(documentId: document.id),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${document['name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  // SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${document['role']}',
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                  // SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${document['tody']}',
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    height: 1,
                                    color: ColorConstant.gray300,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: ColorConstant.gray100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Previous Employees",
                          style: TextStyle(
                              color: ColorConstant.blue500, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('previous')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          return Dismissible(
                            key: Key(document.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              _deletedDocument1 = document;
                              FirebaseFirestore.instance
                                  .collection('previous')
                                  .doc(document.id)
                                  .delete();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Employee data has been deleted."),
                                action: SnackBarAction(
                                  label: "Undo",
                                  onPressed: () {
                                    if (_deletedDocument1 != null) {
                                      Map<String, dynamic> data =
                                          _deletedDocument1!.data()
                                              as Map<String, dynamic>;
                                      FirebaseFirestore.instance
                                          .collection('previous')
                                          .doc(_deletedDocument1!.id)
                                          .set(data);
                                    }
                                  },
                                ),
                              ));
                            },
                            background: Container(
                              color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Icon(Icons.delete, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Edit(documentId: document.id),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${document['name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  // SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${document['role']}',
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                  // SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${document['tody']} - ${document['nodate']}',
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    height: 1,
                                    color: ColorConstant.gray300,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: ColorConstant.gray100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Swipe Left To delete",
                          style: TextStyle(
                              color: ColorConstant.gray500, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.k1Screen);
        },
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
