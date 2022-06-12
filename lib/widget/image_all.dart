part of layoutools;

class ImageAll extends StatelessWidget {
  final String? url;
  final BoxFit? fit;
  final Color? color;
  final double? width;
  final double? height;
  const ImageAll({
    Key? key,
    this.url,
    this.fit = BoxFit.contain,
    this.color = Colors.red,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url!.contains("null")) return const SizedBox();

    if (url!.contains(".svg")) {
      return SvgPicture.asset(
        url!,
        fit: fit!,
        color: color,
        height: height,
        width: width,
      );
    }

    if (url!.contains("assets")) {
      return Image.asset(
        url!,
        fit: fit,
        height: height,
        width: width,
      );
    }

    return Image.network(
      url!,
      fit: fit,
      height: height,
      width: width,
    );
  }
}
