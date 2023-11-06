import 'package:api_get_project/post.dart';
import 'package:api_get_project/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<User?>? user;

  void clickGetButton() {
    setState(() {
      user = getUser();
    });
  }

  void clickDeleteButton() {
    setState(() {
      user = deleteUser();
    });
  }

  void clickPostButton() {
    setState(() {
      user = createUser("Top User", "this is the example user");
    });
  }

  void clickUpdateButtom() {
    setState(() {
      user = updateUser("Update User", "New update example user");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text("http package"),
        ),
      ),
      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder<User?>(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return Container();
                } else {
                  if (snapshot.hasData) {
                    return buildDataWidget(context, snapshot);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return Container();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDataWidget(context, snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              snapshot.data.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(snapshot.data.description),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => clickGetButton(),
              child: const Text("Get user"),
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => clickPostButton(),
              child: const Text("create user"),
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => clickUpdateButtom(),
              child: const Text("update user"),
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => clickDeleteButton(),
              child: const Text("delete user"),
            ),
          )
        ],
      );
}
