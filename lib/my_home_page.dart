import 'package:api_get_project/post.dart';
import 'package:api_get_project/recipe_api.dart';
import 'package:api_get_project/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateFuture = FutureProvider<List<User>>((ref) async {
  return getUsers();
});

final recipeStateFuture = FutureProvider<List<Recipe>>((ref) async {
  return getRecipes();
});

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<User>> users = ref.watch(userStateFuture);
    AsyncValue<List<Recipe>> recipes = ref.watch(recipeStateFuture);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Users"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45 - 25,
              child: users.when(
                  data: (users) {
                    return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            color: Colors.blueAccent,
                            child: Column(
                              children: [
                                Text(users[index].id.toString()),
                                Text(users[index].title.toString()),
                                Text(users[index].userId.toString()),
                                Text(users[index].body.toString()),
                              ],
                            ),
                          );
                        });
                  },
                  error: (error, stack) => Center(
                        child: Text(error.toString()),
                      ),
                  loading: () => Center(
                        child: CircularProgressIndicator(),
                      )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: recipes.when(
                  data: (recipes) {
                    return ListView.builder(
                        itemCount: recipes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            color: Colors.blueAccent,
                            child: Column(
                              children: [
                                Text(recipes[index].name),
                                Text(recipes[index].rating.toString()),
                                Text(recipes[index].totalTime),
                                Text(recipes[index].image),
                              ],
                            ),
                          );
                        });
                  },
                  error: (error, stack) => Center(
                    child: Text(error.toString()),
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
