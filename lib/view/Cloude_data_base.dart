import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaselogin/constant/const.dart';
import 'package:flutter/material.dart';

class CloudDatabase extends StatelessWidget {
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cloud firestore'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'name'),
              ),
              TextFormField(
                controller: _address,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'address'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userDataCollection
                        .add({'name': _name.text, 'address': _address.text})
                        .then((value) => print('add success'))
                        .catchError(
                          (e) => print('add error ===>>>$e}'),
                        );
                  }
                },
                child: Text('Add'),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: userDataCollection.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<DocumentSnapshot> docs = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text('${docs[index].get('name')}'),
                                      Text('${docs[index].get('address')}'),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        userDataCollection
                                            .doc(docs[index].id)
                                            .update({
                                              'address': _address.text,
                                              "name": _name.text
                                            })
                                            .then((value) =>
                                                print('update success'))
                                            .catchError(
                                              (e) =>
                                                  print('update error==>>$e'),
                                            );
                                      },
                                      icon: Icon(Icons.add)),
                                  IconButton(
                                      onPressed: () {
                                        userDataCollection
                                            .doc(docs[index].id)
                                            .delete()
                                            .then((value) =>
                                                print("delete success"))
                                            .catchError((e) => print("$e"));
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              ),
                              // ListTile(
                              //   trailing: IconButton(
                              //     onPressed: () {
                              //       userDataCollection
                              //           .doc(docs[index].id)
                              //           .update({'address': _address.text})
                              //           .then(
                              //               (value) => print('update success'))
                              //           .catchError(
                              //             (e) => print('update error==>>$e'),
                              //           );
                              //
                              //       // userDataCollection
                              //       //     .doc(docs[index].id)
                              //       //     .delete()
                              //       //     .then((value) => print('delete success'))
                              //       //     .catchError(
                              //       //       (e) => print('delete error==>>$e'),
                              //       //     );
                              //     },
                              //     icon: Icon(Icons.edit),
                              //   ),
                              //   title: Text('${docs[index].get('name')}'),
                              //   subtitle: Text('${docs[index].get('address')}'),
                              // ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
