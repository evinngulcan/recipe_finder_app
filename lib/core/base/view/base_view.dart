import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/product/widget/progress/recipe_progress.dart';

import 'base_cubit.dart';

class BaseView<T extends Cubit> extends StatefulWidget {
  final Function(
    T modelRead,
  ) init;
  final Widget Function(BuildContext context, T modelRead, T modelWatch) onPageBuilder;
  final Function(T modelRead)? dispose;
  final bool? visibleProgress;
  const BaseView({Key? key, required this.init, required this.onPageBuilder, this.dispose, this.visibleProgress}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Cubit> extends State<BaseView<T>> {
  late T modelRead;
  late T modelWatch;

  @override
  void initState() {
    if (context.mounted) {
      // context.read<BaseCubit>().changeLoadingState();
    }
    modelRead = context.read<T>();
    widget.init(modelRead);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose != null) {
      widget.dispose!(modelRead);
    }
    super.dispose();
    // modelRead.close();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    modelRead = context.read<T>();
    modelWatch = context.watch<T>();
    return BlocBuilder<BaseCubit, IBaseCubitState>(
      builder: (context, state) {
        if (state is ChangeIsLoadingState) {
          if (state.isLoading == true) {
            return RecipeProgress(child: widget.onPageBuilder(context, modelRead, modelWatch));
          } else {
            return widget.onPageBuilder(context, modelRead, modelWatch);
          }
        } else {
          return widget.onPageBuilder(context, modelRead, modelWatch);
        }
      },
    );
  }
}
