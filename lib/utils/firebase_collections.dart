import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
CollectionReference categoryCollection = FirebaseFirestore.instance.collection('categories');
