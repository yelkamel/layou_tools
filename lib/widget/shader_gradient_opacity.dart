part of layou_tools;

class ShaderGradientOpacity extends StatelessWidget {
  final Widget child;
  final Axis direction;
  final Color? color;
  final bool isDark;
  const ShaderGradientOpacity({
    Key? key,
    required this.child,
    this.direction = Axis.vertical,
    this.color,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final distance = isDark ? 0.03 : 0.01;
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: direction == Axis.horizontal
              ? Alignment.centerLeft
              : Alignment.topCenter,
          end: direction == Axis.horizontal
              ? Alignment.centerRight
              : Alignment.bottomCenter,
          colors: [
            color ?? Theme.of(context).colorScheme.background,
            Colors.transparent,
            Colors.transparent,
            color ?? Theme.of(context).colorScheme.background,
          ],
          stops: [0.0, distance, 1 - distance, 1.0],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}
