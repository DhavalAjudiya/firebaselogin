import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth kFirebaseAuth = FirebaseAuth.instance;

FirebaseFirestore kFireStore = FirebaseFirestore.instance;
CollectionReference userDataCollection = kFireStore.collection("userdata");
