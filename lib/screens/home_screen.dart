import 'package:flutter/material.dart';
import 'package:movie_app_mark_3/constants.dart';
import 'package:movie_app_mark_3/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Series',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: maPrimaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Movies',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'MyList',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        preferredSize: Size(
          getProportionateScreenWidth(900),
          getProportionateScreenHeight(60),
        ),
      ),
      // appBar: AppBar(
      //     // backgroundColor: Colors.red,
      //     ),
    );
  }
}
