import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String?> fetchResumeUrl() async {
    try {
      DocumentSnapshot snapshot = await _db.collection('ash').doc('handlers').get();
      if (snapshot.exists) {
        return snapshot['resume'];
      }
    } catch (e) {
      print('Error fetching resume data: $e');
    }
    return null;
  }

  Future<Map<String, dynamic>?> fetchSMTPDetails() async {
    try {
      DocumentSnapshot snapshot = await _db.collection('ash').doc('SMTP_Section').get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print('Error fetching SMTP details: $e');
    }
    return null;
  }
}
