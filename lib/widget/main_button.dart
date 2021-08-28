part of layoutools;

class MainButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final EdgeInsets margin;
  final TextStyle? textStyle;
  final bool safeArea;
  final double height;
  final List<Color> colors;
  final Widget? trailing;

  const MainButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.margin = const EdgeInsets.all(15),
      this.safeArea = true,
      this.textStyle,
      this.height = 70,
      this.colors = const [
        Color(0xff9FC6FF),
        Color(0xffE58FF9),
        Color(0xffFCD785),
      ],
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childContainer = Container(
      height: height,
      alignment: Alignment.center,
      margin: margin,
      child: GradientAnimated(
        colors: colors,
        borderRadius: BorderRadius.circular(26),
        boxShape: BoxShape.rectangle,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: textStyle ?? Theme.of(context).textTheme.button,
              ),
              if (trailing != null)
                EntranceFader(
                  offset: Offset.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: trailing,
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    return SafeArea(
      left: safeArea,
      right: safeArea,
      bottom: safeArea,
      top: false,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: childContainer,
      ),
    );
  }
}
