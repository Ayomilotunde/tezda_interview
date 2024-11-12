import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_interview/provider/favourite_provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/views/home/components/app_bar.dart';
import 'package:tezda_interview/views/home/components/search.dart';
import 'package:tezda_interview/views/home/components/trending.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<ProductProvider>().fetchAllProducts();
      context.read<FavouriteProvider>().fetchFavourite();
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, provider, Widget? child) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              // YMargin(34),
              DashboardAppBar(name: "Tezda User", userImage: provider.image),
              const YMargin(30),
              const CustomSearchBox(),
              const YMargin(34),
              Trending(
                productProvider: provider,
              )
            ],
          ),
        ),
      ),
    );
  }
}
