import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function? onSwipeRight;
  final IconData? onSwipeRightIcon;
  final String? onSwipeRightText;
  final Function? onSwipeLeft;
  final IconData? onSwipeLeftIcon;
  final String? onSwipeLeftText;

  const SlidableWidget(
      {required this.child,
      this.onSwipeLeft,
      this.onSwipeLeftIcon,
      this.onSwipeLeftText,
      this.onSwipeRight,
      this.onSwipeRightIcon,
      this.onSwipeRightText,
      Key? k})
      : super(key: k);

  @override
  Widget build(BuildContext context) => Slidable(
      key: UniqueKey(),
      startActionPane: onSwipeRight != null
          ? ActionPane(
              key: UniqueKey(),
              motion: const DrawerMotion(),
              children: [
                  SlidableAction(
                    onPressed: (_) =>
                        (onSwipeRight != null) ? onSwipeRight!() : {},
                    backgroundColor: Colors.pink.shade500,
                    foregroundColor: Colors.white,
                    icon: onSwipeRightIcon,
                    label: onSwipeRightText,
                  )
                ])
          : null,
      endActionPane: onSwipeLeft != null
          ? ActionPane(
              key: UniqueKey(),
              motion: const DrawerMotion(),
              dismissible: DismissiblePane(
                key: child.key,
                onDismissed: () =>
                    {(onSwipeLeft != null) ? onSwipeLeft!() : {}},
              ),
              children: [
                  SlidableAction(
                    onPressed: (_) => {},
                    backgroundColor: Colors.red.shade500,
                    foregroundColor: Colors.white,
                    icon: onSwipeLeftIcon,
                    label: onSwipeLeftText,
                  )
                ])
          : null,
      child: child);
}
