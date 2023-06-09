import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constant/enum/image_path_enum.dart';
import '../../../product/model/ingredient/ingredient_model.dart';
import '../../../product/model/recipe_model.dart';
import 'discover_state.dart';

class DiscoverCubit extends Cubit<IDiscoverState> implements IBaseViewModel {
  List<RecipeModel> discoverRecipeList = [
    RecipeModel(
      imagePath: ImagePath.imageSample1.path,
      title: 'Cajun spiced Cauliflower Rice with Chicken uzun text deneme uzun text deneme'
          'uzun text deneme',
      ingredients: [
        IngredientModel(title: 'Egg', quantity: 4),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Egg', quantity: 4),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
      ],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
    ),
    RecipeModel(
      imagePath: ImagePath.imageSample2.path,
      title: 'Cajun spiced Cauliflower Rice with Chicken',
      ingredients: [
        IngredientModel(title: 'Egg', quantity: 4),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
      ],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
    ),
    RecipeModel(
      imagePath: ImagePath.imageSample3.path,
      title: 'Cajun spiced Cauliflower Rice with Chicken',
      ingredients: [
        IngredientModel(title: 'Egg', quantity: 4),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
      ],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
    ),
    RecipeModel(
      imagePath: ImagePath.imageSample4.path,
      title: 'Cajun spiced Cauliflower Rice with Chicken',
      ingredients: [
        IngredientModel(title: 'Egg', quantity: 4),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
      ],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
    ),
    RecipeModel(
      imagePath: ImagePath.imageSample3.path,
      title: 'Cajun spiced Cauliflower Rice with Chicken',
      ingredients: [
        IngredientModel(title: 'Egg', quantity: 4),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
      ],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
    ),
    RecipeModel(
      imagePath: ImagePath.imageSample4.path,
      title: 'Cajun spiced Cauliflower Rice with Chicken',
      ingredients: [
        IngredientModel(title: 'Egg', quantity: 4),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
        IngredientModel(title: 'Butter', quantity: 1 / 2),
      ],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
    ),
  ];
  DiscoverCubit() : super(DiscoverInit());
  int? selectedCategoryIndex;

  void deleteItemFromDiscoverRecipeList(RecipeModel model) {
    discoverRecipeList.remove(model);
    emit(DiscoverRecipeItemListLoad(discoverRecipeList.toSet().toList()));
  }

  @override
  BuildContext? context;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
}
