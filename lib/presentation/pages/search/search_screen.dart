import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: CustomTextField(
                  prefixIcon: const Icon(Icons.search),
                  size: size,
                  controller: searchController,
                  hint: 'Search'),
            ),
            GestureDetector(
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(iconsPath('live.png')),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          SizedBox(
            height: 30,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor, side: BorderSide(width: 1, style: BorderStyle.solid, color: primaryGreyColor)),
                      onPressed: () {},
                      child: Text(
                        'Shop',
                        style: TextStyle(color: primaryBlackColor),
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
