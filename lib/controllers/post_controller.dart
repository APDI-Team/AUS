import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';

class PostController {
  Post post = Post();

  void incrementView() {
    post.views++;
    post.firebaseDocRef?.update({"viewCount": FieldValue.increment(1)});
  }

  void incrementReport() {
    post.reportCount++;
    post.firebaseDocRef?.update({"reportCount": FieldValue.increment(1)});
  }

  void postSave() {
    post.saveCount++;
    post.firebaseDocRef?.update({"saveCount": FieldValue.increment(1)});
  }

  void postSaveCancel() {
    post.saveCount--;
    post.firebaseDocRef?.update({"saveCount": FieldValue.increment(-1)});
  }

  void addComment(DocumentReference newComment) {
    post.firebaseDocRef?.update({
      'comments': FieldValue.arrayUnion([newComment])
    });
    post.commentRefs.add(newComment);
  }

  void addReport(DocumentReference newReport) {
    post.firebaseDocRef?.update({
      'reports': FieldValue.arrayUnion([newReport])
    });
  }

  void lazyDeletePost() {
    post.deleted = true;
    post.firebaseDocRef?.update({'deleted': true});
  }

  PostController(this.post);

  String getPostWriterSchool() => post.getWriterSchool();
}
