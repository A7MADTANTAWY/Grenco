import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // جلب بيانات المستخدم بعد تسجيل الدخول
      final userData = await getCurrentUserData();
      final username = userData?['username'] ?? 'مستخدم';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('مرحبًا $username 👋'),
          backgroundColor: Colors.green,
        ),
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'حدث خطأ أثناء تسجيل الدخول'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  // إنشاء حساب جديد
  Future<UserCredential?> register({
    String role = 'user',
    required String email,
    required String password,
    required String username,
    required BuildContext context,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firestore.collection('users').doc(userCredential.user?.uid).set({
        'email': email,
        'username': username,
        'role': role,
        'createdAt': Timestamp.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم إنشاء الحساب بنجاح'),
          backgroundColor: Colors.green,
        ),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'حدث خطأ أثناء إنشاء الحساب'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCurrentUserData() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return null;

      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc.data();
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return null;
  }
}
