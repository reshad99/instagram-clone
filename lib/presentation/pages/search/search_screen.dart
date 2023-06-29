import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var size = MediaQuery.of(context).size;
    List photos = [
      'photo1.png',
      'photo2.png',
      'photo3.png',
      'photo4.png',
      'photo5.png',
      'photo6.png',
      'photo7.png',
      'photo8.png',
      'photo9.png',
      'photo1.png',
      'photo2.png',
      'photo3.png',
      'photo4.png',
      'photo5.png',
      'photo6.png',
      'photo7.png',
      'photo8.png',
      'photo9.png',
      'photo1.png',
      'photo2.png',
      'photo3.png',
      'photo4.png',
      'photo5.png',
      'photo6.png',
      'photo7.png',
      'photo8.png',
      'photo9.png',
      'photo1.png',
      'photo2.png',
      'photo3.png',
      'photo4.png',
      'photo5.png',
      'photo6.png',
      'photo7.png',
      'photo8.png',
      'photo9.png',
      'photo1.png',
      'photo2.png',
      'photo3.png',
      'photo4.png',
      'photo5.png',
      'photo6.png',
      'photo7.png',
      'photo8.png',
      'photo9.png',
    ];

    var categories = [
      'shop',
      'sport',
      'music',
      'tv',
           'shop',
      'sport',
      'music',
      'tv',
           'shop',
      'sport',
      'music',
      'tv',
           'shop',
      'sport',
      'music',
      'tv',
    ];
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
            prefixIcon: const Icon(Icons.search),
            size: size,
            controller: searchController,
            hint: 'Search'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            side: const BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: primaryGreyColor)),
                        onPressed: () {},
                        child: Text(
                          categories[index],
                          style: const TextStyle(color: primaryBlackColor),
                        )),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                int a = index * 3;
                int b = a + 1 < photos.length ? a + 1 : a;
                int c = b + 1 < photos.length ? b + 1 : b;
                int size = index % 9 == 0 ? 2 : 1;
                return Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: StaggeredGrid.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Image.asset(photosPath('search/${photos[a]}')),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: size,
                        mainAxisCellCount: size,
                        child: Image.asset(photosPath('search/${photos[b]}')),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Image.asset(photosPath('search/${photos[c]}')),
                      ),
                    ],
                  ),
                );
              },
              itemCount: (photos.length / 3).floor(),
            ),
          )
          // Expanded(
          //   child: MasonryGridView.builder(
          //     gridDelegate:
          //         const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2),
          //     semanticChildCount: 5,
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: EdgeInsets.all(2),
          //         child: ClipRRect(
          //             child:
          //                 Image.asset(photosPath('search/${photos[index]}'),)),
          //       );
          //     },
          //     itemCount: photos.length,
          //   ),
          // ),
          // Expanded(
          //     child: GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     childAspectRatio: 0.6,
          //     mainAxisSpacing: 2,
          //     crossAxisSpacing: 2,
          //   ),
          //   itemCount: photos.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     double width = MediaQuery.of(context).size.width / 2 - 2;
          //     double height = (index % 4 == 0) ? width * 1.5 : width;

          //     return Image.asset(
          //       photosPath('search/${photos[index]}'),
          //       fit: BoxFit.cover,
          //       width: width,
          //       height: height,
          //     );
          //   },
          // ))
        ],
      ),
    );
  }
}
