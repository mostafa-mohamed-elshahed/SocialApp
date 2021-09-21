import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/edit_profile/edit_profile.dart';
import 'package:social_app/shared/bloc/cubit.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubitApp,SocialStateApp>(
        builder: (context,state){
          return Column(
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
                             image: NetworkImage(
                                 "https://img.freepik.com/free-photo/businessmen-working-strategic-planning_53876-97634.jpg"
                             ),

                           )
                       ),
                     ),
                   ),
                   CircleAvatar(
                     backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                     radius: 64,
                     child:  CircleAvatar(
                       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                       radius: 60,
                       backgroundImage: NetworkImage(
                       "https://img.freepik.com/free-photo/attented-man-working-office-alone-during-coronavirus-covid-19-quarantine-staying-late-night-young-businessman-manager-doing-tasks-with-smartphone-laptop-tablet-empty-workspace_155003-39482.jpg"
                       ),),
                     ),
                 ],
               ),
             ),
              Text("Mostafa El Farouk",style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 8,),
              InkWell(child: Text("Write your bio ...",style: Theme.of(context).textTheme.caption,),onTap: (){},),
              SizedBox(height: 12,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("posts"),
                        Text("100"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Followers"),
                        Text("14k"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Following"),
                        Text("860"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Photos "),
                        Text("650"),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: (){}, child: Text("Add Photo",style: Theme.of(context).textTheme.bodyText1,),)),
                 SizedBox(width: 12,),
                  OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));}, child: Icon(IconBroken.Edit,color: Theme.of(context).textTheme.bodyText1!.color,) ,),
                ],
              ),

            ],
          );
        },
        listener: (context,state){},
    );
  }
}