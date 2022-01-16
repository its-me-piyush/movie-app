import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_mark_3/constants.dart';
import 'package:movie_app_mark_3/provider/genres_provider.dart';
import 'package:movie_app_mark_3/provider/top_row_provider.dart';
import 'package:movie_app_mark_3/provider/get_popular_provider.dart';
import 'package:movie_app_mark_3/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: ListView(
          children: [
            // Header options series | tv | mylist
            const CustomTopRow(),

            // Custom Tv Popular List
            const CustomPopularTab(),

            // Gap
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),

            // GenresList
            const GenresList(),
          ],
        ),
      ),
    );
  }
}

class CustomPopularTab extends StatelessWidget {
  const CustomPopularTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final whatSelected = Provider.of<TopRowProvider>(context).getWhatSelected();
    return FutureBuilder(
      future: whatSelected == '001'
          ? Provider.of<GetPopularProvider>(context, listen: false)
              .getTvPopular()
          : Provider.of<GetPopularProvider>(context, listen: false)
              .getMoviePopular(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: maPrimaryLightColor,
              backgroundColor: maPrimaryColor,
              strokeWidth: 5,
            ),
          );
        }

        var data = snapshot.data as List;

        return CarouselSlider.builder(
          itemCount: data.length, // movies.length
          itemBuilder: (context, index, _) {
            return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:
                        // 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSRyzmDo83KY0dClkpu3VPWZ0tMfzySsKqBO8YAouuFJxwNXMOU',
                        "https://image.tmdb.org/t/p/original/${data[index]['backdrop_path']}",
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(''),
                        ),
                      ),
                    ),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                    left: 15,
                  ),
                  child: Text(
                    whatSelected == '001'
                        ? "${data[index]['name']}".toUpperCase()
                        : "${data[index]['title']}".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 2),
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
        );
      },
    );
  }
}

class GenresList extends StatelessWidget {
  const GenresList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final whatsSelected =
        Provider.of<TopRowProvider>(context).getWhatSelected();
    return FutureBuilder(
      future: whatsSelected == '001'
          ? Provider.of<GenresProvider>(context, listen: false).getTvGeners()
          : Provider.of<GenresProvider>(context, listen: false).getMovieGeners(),
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
        var genresList = whatsSelected == '001'
            ? Provider.of<GenresProvider>(context).tvGeners
            : Provider.of<GenresProvider>(context).movieGeners;

        return SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(50),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genresList.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: genresList[index].isSelected
                      ? MaterialStateProperty.all(maPrimaryColor)
                      : MaterialStateProperty.all(maGlassGloss),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(10),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  whatsSelected == '001'
                      ? Provider.of<GenresProvider>(context, listen: false)
                          .changeTvSelected(genresList[index].id)
                      : Provider.of<GenresProvider>(context, listen: false)
                          .changeMovieSelected(genresList[index].id);
                },
                child: Text(
                  genresList[index].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: genresList[index].isSelected
                        ? getProportionateScreenWidth(20)
                        : getProportionateScreenWidth(15),
                    fontWeight: genresList[index].isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomTopRow extends StatelessWidget {
  const CustomTopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topRowList = Provider.of<TopRowProvider>(context).topRowItems;

    return SizedBox(
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
