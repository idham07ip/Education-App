import 'package:education_app2/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
Reference get firebaseStorage => FirebaseStorage.instance.ref();

final userRF = fireStore.collection("users");
final questionPaperReferences = fireStore.collection('questionPapers');

DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperReferences
        .doc(paperId)
        .collection("questions")
        .doc(questionId);
