import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/controller/search_user_controller.dart';
import 'package:tik_tok_clone/model/user.dart';
import 'package:tik_tok_clone/view/widgets/text_input.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchQuery = TextEditingController();
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 11.h, bottom: 11.h),
              hintText: "Search Username",
            ),
            controller: searchQuery,
            onChanged: (value) {
              searchController.searchUser(value);
            },
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? Center(
                child: Text(
                  "Search Users",
                ),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  myUser user = searchController.searchedUsers[index];
                  return ListTile(
                    onTap: () {
                      Get.snackbar("You clicked ${user.name}",
                          "Opening Profile Page of it");
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        user.profilePhoto,
                      ),
                    ),
                    title: Text(
                      user.name,
                    ),
                  );
                },
              ),
      );
    });
  }
}
