import 'package:flutter/material.dart';
import 'package:projeto01/controllers/home_controller.dart';
import 'package:projeto01/models/post_model.dart';
import 'package:projeto01/repositories/home_repository_imp.dart';
import 'package:projeto01/services/prefes_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, list, __) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: ((_, index) => ListTile(
                    leading: Text(list[index].id.toString()),
                    trailing: const Icon(Icons.arrow_forward),
                    title: Text(list[index].title),
                    onTap: () => Navigator.of(context).pushNamed('/detailsPage', arguments: list[index]),
                  )),
              separatorBuilder: (_, __) => const Divider(),
            );
          },
        ));
  }
}
