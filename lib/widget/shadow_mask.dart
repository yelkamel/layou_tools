part of layou_tools;

enum ShadowPosition {
  top,
  bottom,
}

class ShadowMaskContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final ShadowPosition position;
  const ShadowMaskContainer({
    Key? key,
    required this.child,
    this.color,
    this.position = ShadowPosition.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (position == ShadowPosition.top) child,
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 0.00),
              blurRadius: 10.0,
              color: color ?? Theme.of(context).backgroundColor,
              spreadRadius: 12.00,
            ),
          ]),
        ),
        if (position == ShadowPosition.bottom) child,
      ],
    );
  }
}
