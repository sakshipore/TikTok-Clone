import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/controller/comment_controller.dart';
import 'package:tik_tok_clone/view/widgets/text_input.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({
    required this.id,
  });

  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostID(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: commentController.comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          // backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              commentController.comments[index].profilePic),
                        ),
                        title: Row(
                          children: [
                            Text(
                              commentController.comments[index].username,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              commentController.comments[index].comment,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              tago.format(commentController
                                  .comments[index].datePub
                                  .toDate()),
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "${commentController.comments[index].likes.length}",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {
                            commentController.likeComment(
                                commentController.comments[index].id);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: commentController.comments[index].likes.contains(
                                    FirebaseAuth.instance.currentUser!.uid)
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Divider(),
              ListTile(
                title: TextInputField(
                  controller: _commentController,
                  myIcon: Icons.comment,
                  myLabelText: "Comment",
                ),
                trailing: TextButton(
                  onPressed: () {
                    commentController.postComment(_commentController.text);
                  },
                  child: Text(
                    "Send",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
