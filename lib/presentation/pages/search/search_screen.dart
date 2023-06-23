import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: CustomTextField(
                prefixIcon: const Icon(Icons.search),
                  size: size,
                  controller: searchController,
                  hint: 'Search'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Search'),
      ),
    );
  }
}
