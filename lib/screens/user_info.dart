import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_typicode_flutter/common/models/user.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().primaryColor,
        title: const Text("User Info"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                CupertinoIcons.person_alt_circle,
                size: 60,
              ),
              // Id
              Divider(),
              Text("Id : ${user.id}"),

              // Name
              Divider(),
              Text("Name : ${user.name}"),

              // UserName
              Divider(),
              Text("UserName : ${user.username}"),

              // Email
              Divider(),
              Text("Email : ${user.email}"),

              // Phone
              Divider(),
              Text("Phone : ${user.phone}"),

              // Website
              Divider(),
              Text("Website : ${user.website}"),

              // Email
              Divider(),
              Text("Email"),
              Text("\tcity : ${user.address.city}"),
              Text("\tstreet : ${user.address.street}"),
              Text("\tsuite : ${user.address.suite}"),
              Text("\tzipcode : ${user.address.zipcode}"),
              Text("Geo"),
              Text("\t\tlat : ${user.address.geo.lat}"),
              Text("\t\tlng : ${user.address.geo.lng}"),

              // Company
              Divider(),
              Text("Company"),
              Text("\tbs : ${user.company.bs}"),
              Text("\tcatchPhrase : ${user.company.catchPhrase}"),
              Text("\tname : ${user.company.name}"),
            ],
          ),
        ),
      ),
    );
  }
}
