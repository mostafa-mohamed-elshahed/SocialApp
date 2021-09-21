import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/bloc/cubit.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/styles/colors.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubitApp, SocialStateApp>(
        builder: (context, state) {
          var cubit = SocialCubitApp.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Card(
                            child: Image(
                          image: NetworkImage(
                              "https://i1.wp.com/jldavidagency.com/wp-content/uploads/2021/03/what-to-expect-at-a-commerical-audition.jpg?resize=1024%2C576&ssl=1"
                          ),
                          height: 180,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, right: 16),
                          child: Text(
                            "Communicate With Friends",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) => builderList(context),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8,
                            ),
                        itemCount: 10),
                  ],
                )),
          );
        },
        listener: (context, state) {});
  }

  Widget builderList(context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).textTheme.headline6!.backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                            "https://image.freepik.com/free-photo/shot-happy-man-wears-yellow-hat-white-t-shirt-spreads-palms-sideways-glad-meet-old-friend-laughs-looks-with-joy_273609-38453.jpg",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Mostafa El Farouk",
                                  style: Theme.of(context).textTheme.bodyText2),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "August 29, 2021 at 11:36 Am",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.format_list_bulleted))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Container(
                        color: Colors.grey[300],
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "#Family",
                                style: TextStyle(color: defaultColor),
                              ),
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "#Freinds",
                                style: TextStyle(color: defaultColor),
                              ),
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "#Time Travel",
                                style: TextStyle(color: defaultColor),
                              ),
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "#Moveis",
                                style: TextStyle(color: defaultColor),
                              ),
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image(
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/three-young-excited-men-jumping-together_171337-36887.jpg"),
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text("1200"),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text("Comment"),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconBroken.Chat,
                                  color: Colors.amber,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Container(
                        color: Colors.grey[300],
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                            "https://image.freepik.com/free-photo/shot-happy-man-wears-yellow-hat-white-t-shirt-spreads-palms-sideways-glad-meet-old-friend-laughs-looks-with-joy_273609-38453.jpg",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Write Comment",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "Like",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
