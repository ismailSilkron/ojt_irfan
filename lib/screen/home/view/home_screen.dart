import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ojt_irfan/config/theme/app_pallete.dart';
import 'package:ojt_irfan/screen/home/bloc/home_bloc.dart';
import 'package:ojt_irfan/screen/home/model/category.dart';
import 'package:ojt_irfan/utils/constant/image_asset.dart';
import 'package:ojt_irfan/utils/widget/show_snackbar.dart';

part '../home_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _homeBloc;

  final TextEditingController _searchController = TextEditingController();

  List<Category> _storeCategoryList = [];

  @override
  void initState() {
    _homeBloc = HomeBloc()..add(InitiateApp());

    super.initState();
  }

  @override
  void dispose() async {
    await _homeBloc.close();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(context),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) async {
          if (state is LoadingInitiateApp) {
            await showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          }

          if (state is SuccessInitiateApp) {
            if (mounted) {
              Navigator.of(context).pop();
            }

            _storeCategoryList.addAll(state.categoryList);

            if (mounted) {
              showSnackbar(
                context: context,
                message: "Success get category list",
              );
            }
          }
        },
        builder: (context, state) {
          if (state is SuccessInitiateApp) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                _searchField(_searchController, (searchText) async {
                  setState(() {
                    _storeCategoryList = state.categoryList
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(searchText!.toLowerCase()))
                        .toList();
                  });
                }),
                const Gap(30),
                _categoriesSection(context, _storeCategoryList),
              ],
            );
          }

          return Center(
            child: Text(
              "No Data Found",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      ),
    );
  }
}
