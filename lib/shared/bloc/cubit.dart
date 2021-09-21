
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/create_user_model.dart';
import 'package:social_app/modules/add_post/add_post.dart';
import 'package:social_app/modules/chats_screen/chats_screen.dart';
import 'package:social_app/modules/home_screen/home_screen.dart';
import 'package:social_app/modules/settings_screen/settings_screen.dart';
import 'package:social_app/modules/users_screen/users_screen.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class SocialCubitApp extends Cubit<SocialStateApp>{
  SocialCubitApp() : super(InitialAppState());
 static SocialCubitApp get(context)=>BlocProvider.of(context);

bool isVisible=false;
void changeVisibility(){
  isVisible= !isVisible;
  emit(VisibilityAppState());
}


  CreateUsersModel? usersModel;
void getUserData(){
  FirebaseFirestore.instance.collection("users").doc(uId).get().then((value) {
    usersModel=CreateUsersModel.fromJson(value.data()!);
    print(usersModel!.name);
    print(usersModel!.password);
    print(usersModel!.bio);
    emit(GetUserDataSuccessAppState());
  }).catchError((onError){
    print(onError.toString());
    emit(GetUserDataErrorAppState());
  });
}


int currentIndex=0;
void currentIndexChange(index,context){
  if (index==2) {
      emit(BottomNavBarAddPostAppState());
    } else
  currentIndex=index;
  emit(BottomNavBarAppState());
}
List<Widget> screens=[
HomeScreen(),
ChatsScreen(),
AddPost(),
UsersScreen(),
SettingsScreen(),
];
List<String> titles=[
  "Home Screen",
  "Chats Screen",
  "AddPost Screen",
  "Users Screen",
  "Settings Screen",
];

  void userLogin({
    required String? email,
    required String? password,
  })
  {
FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!).then((value)
{
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLoginSucState(value.user!.uid.toString()));
    }).catchError((onError){
      print(onError.toString());
      emit(SocialLoginEroState(onError));

});
  }
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    // required String image,
    // required String cover,
    // required String bio,

  })
  {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      createUsers(name: name, email: email, password: password, phone: phone, uid: value.user!.uid);
      emit(SocialRegisterSucState(value.user!.uid.toString()));
    }).catchError((onError){
      print(onError);
      emit(SocialRegisterEroState(onError));

    });
  }

void createUsers({
  required String name,
  required String email,
  required String password,
  required String phone,
  required String uid,
}){
  CreateUsersModel model =CreateUsersModel(
      uid: uid,
      email: email,
      phone: phone,
      name: name,
      password: password,
      image:"https://img.freepik.com/free-photo/attented-man-working-office-alone-during-coronavirus-covid-19-quarantine-staying-late-night-young-businessman-manager-doing-tasks-with-smartphone-laptop-tablet-empty-workspace_155003-39482.jpg",
      cover:"https://img.freepik.com/free-photo/businessmen-working-strategic-planning_53876-97634.jpg",
      bio: "Write your bio ...",
  );
  FirebaseFirestore.instance.collection("users")
      .doc(uid)
      .set(model.usersMap())
      .then((value) {
    emit(CreateUsersSuccessEmit());

  })
      .catchError((onError) {
        print(onError.toString());
    emit(CreateUsersErrorEmit(onError.toString()));
      });

}



  File? profileImage;
  final pickerProfile = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await pickerProfile.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        emit(SuccessImagePickedScreenAppState());
      } else {
        print('No image selected.');
        emit(ErrorImagePickedScreenAppState());

      }
  }




  File? coverImage;
  final pickerCover = ImagePicker();
  Future<void> getCoverImage() async {
    final pickedFile = await pickerCover.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        coverImage = File(pickedFile.path);
        emit(SuccessCoverPickedScreenAppState());
      } else {
        print('No image selected.');
        emit(ErrorCoverPickedScreenAppState());

      }
  }
}

