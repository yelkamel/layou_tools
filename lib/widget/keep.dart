part of layou_tools;

class Keep extends StatefulWidget {
  final Widget child;
  const Keep({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _KeepState createState() => _KeepState();
}

class _KeepState extends State<Keep> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }
}
