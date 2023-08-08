import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yo_event/views/home.dart';

import '../ReusableWidgets/nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../views/profile/profile_add.dart';
import 'package:path/path.dart' as Path;

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;
  
   
  void login({String? email, String? password}) {
    isLoading(true);

    auth
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      /// Login Success

      isLoading(false);
         



      Get.to(() => Navigation_Bar());
    }).catchError((e) {
      isLoading(false);
      Get.snackbar('Error', "$e",
          colorText: Colors.white, backgroundColor: Colors.red);

      ///Error occured
      //
      // Clear the input fields on error
        
      
    });
  }

  void signUp({String? email, String? password}) {
    ///here we have to provide two things
    ///1- email
    ///2- password

    isLoading(true);

    auth
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      isLoading(false);

      /// Navigate user to profile screen
      Get.to(() => ProfileScreen());
    }).catchError((e) {
      /// print error information
      print("Error in authentication $e");
      isLoading(false);
      Get.snackbar('Error', "$e", // Show the error message as a snackbar
          colorText: Colors.white,
          backgroundColor: Colors.red);
    });
  }

  void forgetPassword(String email) {
    auth.sendPasswordResetEmail(email: email).then((value) {
      Get.back();
      Get.snackbar('Email Sent', 'We have sent password reset email');
    }).catchError((e) {
      print("Error in sending password reset email is $e");
    });
  }

  signInWithGoogle(BuildContext context) async {
    isLoading(true);
   
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      isLoading(false);

      // Successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Navigation_Bar()),
      );
    } catch (e) {
      // Error in getting Login
      isLoading(false);
      print("Error is $e");
      Fluttertoast.showToast(
        msg: "Error signing in with Google. Please try again later.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
       
    }
  }

  // signInWithGoogle() async {
  //   isLoading(true);
   
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   FirebaseAuth.instance.signInWithCredential(credential).then((value) {
  //     isLoading(false);

  //     //SuccessFull loged in
  //      Navigator.pushReplacement(
  //       context as BuildContext,
  //       MaterialPageRoute(builder: (context) => Navigation_Bar()),
  //     );
  //   } catch (e) {
  //     // Error in getting Login
  //     isLoading(false);
  //     print("Error is $e");
  //     Fluttertoast.showToast(
  //       msg: "Error signing in with Google. Please try again later.",
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
    
  //   }
  // }

  

  // signInWithGoogle() async {
  //   isLoading(true);
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   FirebaseAuth.instance.signInWithCredential(credential).then((value) {
  //     isLoading(false);

  //     ///SuccessFull loged in
  //     Get.to(() => Navigation_Bar());
  //   }).catchError((e) {
  //     /// Error in getting Login
  //     isLoading(false);
  //     print("Error is $e");
  //   });
  // }

 var isProfileInformationLoading = false.obs;

  Future<String> uploadImageToFirebaseStorage(File image) async {
    String imageUrl = '';
    String fileName = Path.basename(image.path);

    var reference =
        FirebaseStorage.instance.ref().child('profileImages/$fileName');
    UploadTask uploadTask = reference.putFile(image);

    try {
    TaskSnapshot taskSnapshot = await uploadTask;
    imageUrl = await taskSnapshot.ref.getDownloadURL();
  } catch (e) {
    print("Error happened: $e");
  }
     
    // TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    // await taskSnapshot.ref.getDownloadURL().then((value) {
    //   imageUrl = value;
    // }).catchError((e) {
    //   print("Error happen $e");
    

    return imageUrl;
  }

  uploadProfileData(String imageUrl, String firstName, String lastName,
      String mobileNumber, String dob, String gender) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'image': imageUrl,
      'first': firstName,
      'last': lastName,
      'dob': dob,
      'gender': gender
    }).then((value) {
      isProfileInformationLoading(true);
      Get.offAll(() => const Navigation_Bar());
    });
  }
  }

