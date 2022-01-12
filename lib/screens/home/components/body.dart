import 'package:flutter/material.dart';
import 'package:movie_app_mark_3/provider/genres_provider.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: FutureBuilder(
          future:
              Provider.of<GenresProvider>(context, listen: false).getGeners(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(
              child: Text('Hurryyy!!'),
            );
          },
        ),
      ),
    );
  }
}