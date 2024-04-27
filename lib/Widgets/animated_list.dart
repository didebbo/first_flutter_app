import 'package:first_flutter_app/Models/item.dart';
import 'package:first_flutter_app/Pages/HomePage/view_model.dart';
import 'package:first_flutter_app/Widgets/Animations/transaction_provider.dart';
import 'package:first_flutter_app/Widgets/item.dart';
import 'package:flutter/material.dart';

class FadeInAnimatedListView extends StatefulWidget {
  const FadeInAnimatedListView({super.key, required this.viewModel});

  final HomePageViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _FadeInAnimatedListViewState();
}

class _FadeInAnimatedListViewState extends State<FadeInAnimatedListView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400))
    ..forward();

  @override
  Widget build(BuildContext context) => animatedListView();

  Widget animatedListView() {
    return TransitionProvider.fadeTransition(
        _fadeController,
        Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: AnimatedList(
                key: widget.viewModel.animatedListKey,
                initialItemCount: widget.viewModel.items.length,
                itemBuilder: (context, index, animation) {
                  var item = widget.viewModel.items[index];
                  return animatedListItemView(animation, item);
                })));
  }

  Widget animatedListItemView(Animation<double> animation, Item item) {
    return TransitionProvider.fadeAndSlideTransition(
      animation,
      AnimatedListItemView(
        item: item,
        onPressFavoriteIcon: () =>
            setState(() => widget.viewModel.onPressFavoriteIcon(item)),
        onPressDeleteIcon: () => setState(
          () => widget.viewModel.onPressDeleteIcon(animation, item),
        ),
      ),
    );
  }
}
