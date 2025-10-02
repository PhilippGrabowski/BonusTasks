import 'package:bonus_tasks/jp_project/models/snack.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/snack_info_carousel/snack_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SnackInfoCarousel extends StatefulWidget {
  const SnackInfoCarousel({super.key, required this.snacks, required this.onFavorite});

  final List<Snack> snacks;
  final void Function(Snack) onFavorite;

  @override
  State<SnackInfoCarousel> createState() => _SnackInfoCarouselState();
}

class _SnackInfoCarouselState extends State<SnackInfoCarousel> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  bool _userScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 10))
      ..addListener(_autoScroll);

    if (widget.snacks.length >= 3) {
      _animationController.repeat(reverse: true);
    }
  }

  void _autoScroll() {
    if (!_scrollController.hasClients | _userScrolling) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    _scrollController.jumpTo(_animationController.value * maxScroll);
  }

  void _stopAutoScroll() {
    _animationController.stop();
  }

  void _startAutoScroll() {
    if (widget.snacks.length >= 3) {
      _animationController.repeat(reverse: true);
    }
  }

  void _syncAnimationWithScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    if (maxScroll <= 0) return;

    final currentOffset = _scrollController.offset.clamp(0.0, maxScroll);
    final progress = currentOffset / maxScroll;
    _animationController.value = progress;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is UserScrollNotification) {
          if (notification.direction != ScrollDirection.idle) {
            _userScrolling = true;
            _stopAutoScroll();
          } else {
            _userScrolling = false;
            _syncAnimationWithScroll();
            _startAutoScroll();
          }
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.snacks.length, (index) {
            return GestureDetector(
              onTap: () async {
                _stopAutoScroll();
                await showMaterialModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                  duration: const Duration(milliseconds: 400),
                  builder: (context) => SizedBox(
                    height: 818,
                    child: CustomBottomSheet(snack: widget.snacks[index], onFavorite: widget.onFavorite),
                  ),
                );
                _syncAnimationWithScroll();
                _startAutoScroll();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: 200,
                  child: SnackInfoCard(
                    snack: widget.snacks[index],
                    onFavorite: () => widget.onFavorite(widget.snacks[index]),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
