import 'package:flutter/material.dart';
import 'package:movie_app_mark_3/constants.dart';
import 'package:movie_app_mark_3/provider/genres_provider.dart';
import 'package:movie_app_mark_3/provider/top_row_provider.dart';
import 'package:movie_app_mark_3/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topRowList = Provider.of<TopRowProvider>(context).topRowItems;
    return SafeArea(
      child: SizedBox(
        child: ListView(
          children: [
            // Header options series | tv | mylist
            SizedBox(
              height: getProportionateScreenHeight(70),
              width: double.infinity,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: topRowList.length,
                  itemBuilder: (context, index) {
                    return CustomTextButton(
                      onPressed: () {
                        Provider.of<TopRowProvider>(context, listen: false)
                            .changeSelected(topRowList[index].id);
                      },
                      text: topRowList[index].title,
                      selected: topRowList[index].isSelected,
                    );
                  },
                ),
              ),
            ),
            FutureBuilder(
              future: Provider.of<GenresProvider>(context, listen: false)
                  .getGeners(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: maPrimaryLightColor,
                      backgroundColor: maPrimaryColor,
                      strokeWidth: 5,
                    ),
                  );
                }
                var genresList =
                    Provider.of<GenresProvider>(context, listen: false).geners;
                genresList.forEach((element) {
                  print(element.name);
                });
                return const Center(
                  child: Text(
                    'Hurryyy!!',
                    style: TextStyle(
                      color: maTextColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.selected,
  }) : super(key: key);
  final String text;
  final void Function()? onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: selected ? maPrimaryColor : Colors.white,
          fontSize: getProportionateScreenWidth(30),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
