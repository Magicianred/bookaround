import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class References {
  static const String appName = "Bookaround";
  static const String fox = "🦊";

  static CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  static CollectionReference booksCollection = FirebaseFirestore.instance.collection("books");
  static CollectionReference isbnsCollection = FirebaseFirestore.instance.collection("isbns");

  static Reference bookCovers = FirebaseStorage.instance.ref("bookCovers/");

  static const String googleApiKey = "AIzaSyDTMDGyTZOPkaesYHW4vYfVMhUHafc8nl0";
}