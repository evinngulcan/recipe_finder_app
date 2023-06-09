import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/constant/enum/image_path_enum.dart';
import 'package:recipe_finder/feature/home_page/cubit/home_state.dart';
import 'package:recipe_finder/product/model/ingredient/ingredient_model.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constant/enum/hive_enum.dart';
import '../../../core/init/cache/hive_manager.dart';
import '../../../product/model/user_model.dart';
import '../service/home_service.dart';

class HomeCubit extends Cubit<IHomeState> implements IBaseViewModel {
  late final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  IHomeService? service;
  late TextEditingController searchTextController;
  HomeCubit() : super(HomeInit());

  List<IngredientModel> searchByMeal = [];
  List<IngredientModel> category = [];
  List<IngredientModel> essentialsItem = [];
  List<IngredientModel> vegateblesItem = [];

  List<IngredientModel> myFrizeItems = [
    IngredientModel(title: 'milk', imagePath: ImagePath.milk.path, quantity: 6),
    IngredientModel(title: 'bread', imagePath: ImagePath.bread.path, quantity: 3),
    IngredientModel(title: 'salad', imagePath: ImagePath.salad.path, quantity: 2),
    IngredientModel(title: 'egg', imagePath: ImagePath.egg.path, quantity: 3),
    IngredientModel(title: 'potato', imagePath: ImagePath.potato.path, quantity: 2),
    IngredientModel(title: 'chicken', imagePath: ImagePath.chicken.path, quantity: 2),
  ];

  @override
  Future<void> init() async {
    service = HomeService();
    searchTextController = TextEditingController();
    searchByMeal = service!.fetchSearchByMealList();
    category = service!.fetchCategoryList();
    essentialsItem = service!.fetchEssetialsList();
    vegateblesItem = service!.fetchVegatablesList();
    /* final HiveManager hiveManager = HiveManager(HiveBoxEnum.user);
    var user = hiveManager.getItem(HiveKeyEnum.user);
    print(user?.token);
    print(user);
    print(hiveManager.getValues()?.first);*/
    final IHiveManager<User> hiveManager = HiveManager<User>(HiveBoxEnum.userModel);
    await hiveManager.openBox();
    final data = hiveManager.get(HiveKeyEnum.user);

    if (kDebugMode) {
      print(data?.username);
      print(data?.password);
    }
    hiveManager.close();
  }

  @override
  BuildContext? context;

  void searchByMealList() {
    searchByMeal = service!.fetchSearchByMealList();
    emit(SearchByMealListLoaded(searchByMeal));
  }

  void categoryList() {
    category = service!.fetchCategoryList();
    emit(CategoryListLoaded(category));
  }

  void essentialHomeList() {
    essentialsItem = service!.fetchEssetialsList();
    emit(EssentialListLoaded(essentialsItem));
  }

  void vegatableHomeList() {
    vegateblesItem = service!.fetchVegatablesList();
    emit(VegatableListLoaded(vegateblesItem));
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
