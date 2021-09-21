import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/bloc/cubit.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubitApp, SocialStateApp>(
      builder: (context, state) {
        var cubit = SocialCubitApp.get(context);
        var profileImage = SocialCubitApp.get(context).profileImage;
        var coverImage = SocialCubitApp.get(context).coverImage;
        nameController.text = cubit.usersModel!.name!;
        bioController.text = cubit.usersModel!.bio!;

        return Scaffold(
          appBar: defaultAppBar(context: context, title: "Edit Profile"),
          body: ListView(children: [
            Column(
              children: [
                Container(
                  height: 240,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image:coverImage==null ? NetworkImage(
                                "https://img.freepik.com/free-photo/businessmen-working-strategic-planning_53876-97634.jpg"):
                                FileImage(coverImage) as ImageProvider,
                          )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {cubit.getCoverImage();},
                          icon: CircleAvatar(
                            backgroundColor: Theme.of(context).iconTheme.color,
                            child: Icon(
                              Icons.camera_alt,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).appBarTheme.backgroundColor,
                        radius: 64,
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).appBarTheme.backgroundColor,
                          radius: 60,
                          backgroundImage: profileImage == null
                              ? NetworkImage(
                                  "https://img.freepik.com/free-photo/attented-man-working-office-alone-during-coronavirus-covid-19-quarantine-staying-late-night-young-businessman-manager-doing-tasks-with-smartphone-laptop-tablet-empty-workspace_155003-39482.jpg")
                              : FileImage(profileImage) as ImageProvider,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                cubit.getProfileImage();
                              },
                              icon: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).iconTheme.color,
                                child: Icon(
                                  Icons.camera_alt,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "The Value is empty";
                          }
                        },
                        label: "Change Name",
                        prefix: IconBroken.User,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: bioController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "The Value is empty";
                            }
                          },
                          label: "Change Bio",
                          prefix: IconBroken.Chat),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        );
      },
      listener: (context, state) {},
    );
  }
}
