import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/search/bloc/explore/explore_bloc.dart';
import 'package:instagram_clone/data/search/bloc/search/search_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/loading.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/user_list_widget.dart';
import 'package:instagram_clone/services/response/error_handler.dart';

@RoutePage(name: 'SearchRouter')
class SearchRouterScreen extends AutoRouter {}

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late FocusNode focusNode;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Post> posts = [];
    Timer? debounce;
    String lastQuery = '';

    void trySearch(String query) {
      if (debounce?.isActive ?? false) debounce!.cancel();
      debounce = Timer(const Duration(seconds: 2), () {
        if (query.length >= 3 && query != lastQuery) {
          lastQuery = query;

          context.read<SearchBloc>().add(TrySearch(query: query));
        }
      });
    }

    List<String> categories = [
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
            focusNode: focusNode,
            onChanged: (value) {
              setState(() {
                searchController.text = value;
                trySearch(value);
              });
            },
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    searchController.text = '';
                  });
                },
                icon: Icon(Icons.highlight_remove_outlined)),
            borderRadius: 10,
            prefixIcon: const Icon(Icons.search),
            size: size,
            controller: searchController,
            hint: 'Search'),
      ),
      body: searchController.text.isNotEmpty
          ? searchUsers()
          : explorePosts(posts, categories),
    );
  }

  BlocBuilder<SearchBloc, SearchState> searchUsers() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        debugPrint('search state is $state');
        if (state is SearchLoading) {
          return const LoadingScreen();
        }

        if (state is SearchError) {
          ErrorHandler.showError(context, state.errorResponse);
        }

        if (state is SearchLoaded) {
          return UserListWidget(users: state.users);
        }

        return const SizedBox();
      },
    );
  }

  BlocBuilder<ExploreBloc, ExploreState> explorePosts(
      List<Post> posts, List<String> categories) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state is LatestPostsLoading) {
          return const LoadingScreen();
        }

        if (state is LatestPostsError) {
          ErrorHandler.showError(context, state.errorResponse);
          return const SizedBox();
        }

        if (state is LatestPostsLoaded) {
          posts = state.posts;
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ExploreBloc>().add(FetchLatestPosts());
          },
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              categoryList(categories),
              SizedBox(
                height: 10.h,
              ),
              postList(posts)
            ],
          ),
        );
      },
    );
  }

  SizedBox categoryList(List<String> categories) {
    return SizedBox(
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
    );
  }

  Expanded postList(List<Post> posts) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          int a = index * 3;
          int b = a + 1 < posts.length ? a + 1 : a;
          int c = b + 1 < posts.length ? b + 1 : b;
          int size = index % 9 == 0 ? 2 : 1;
          return Padding(
            padding: const EdgeInsets.only(top: 3),
            child: StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              children: [
                staggeredGridTile(posts, a, 1),
                staggeredGridTile(posts, b, size),
                staggeredGridTile(posts, c, 1),
              ],
            ),
          );
        },
        itemCount: (posts.length / 3).floor(),
      ),
    );
  }

  StaggeredGridTile staggeredGridTile(List<Post> posts, int a, int count) {
    return StaggeredGridTile.count(
      crossAxisCellCount: count,
      mainAxisCellCount: count,
      child: Image.network(
        posts[a].media!.first.path!,
        fit: BoxFit.cover,
      ),
    );
  }
}
