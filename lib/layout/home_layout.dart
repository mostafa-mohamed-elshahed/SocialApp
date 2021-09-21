

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/add_post/add_post.dart';
import 'package:social_app/shared/bloc/cubit.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class HomeLayOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubitApp,SocialStateApp>(
      builder: (BuildContext context, state) {
        var cubit=SocialCubitApp.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex],style: Theme.of(context).textTheme.bodyText1,),
            actions: [
              IconButton(onPressed: (){

              }, icon: Icon(IconBroken.Notification),),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(onPressed: (){

                }, icon: Icon(IconBroken.Search),),
              ),
            ],
            elevation: 5,

          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.currentIndexChange(index,context);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: "Home",),
              BottomNavigationBarItem(icon: Icon(IconBroken.Chat),label: "Chat",),
              BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload),label: "Add Post",),
              BottomNavigationBarItem(icon: Icon(IconBroken.User1),label: "User",),
              BottomNavigationBarItem(icon: Icon(IconBroken.Setting),label: "Settings",),
            ],
            // backgroundColor: Colors.grey,
            // elevation: 50,
            // selectedItemColor: Colors.amber,
            // unselectedItemColor: Colors.black,
            showUnselectedLabels: false,
          ),

        );
      },
      listener: (BuildContext context, Object? state) {
        if(state is BottomNavBarAddPostAppState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost()));
        }
      },
    );
  }
}
