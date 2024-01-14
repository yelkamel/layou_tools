part of layou_tools;

class LoadingDots extends StatefulWidget {
  final int numberOfDots;
  final Color color;
  final double size;
  final Duration duration;
  final double distance;
  final double height;

  const LoadingDots(
      {Key? key,
      this.numberOfDots = 3,
      this.color = Colors.white,
      this.size = 7,
      this.duration = const Duration(milliseconds: 300),
      this.distance = 7,
      this.height = 20});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with TickerProviderStateMixin {
  late List _animationControllers;

  final List<Animation> _animations = [];

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    ///initialization of _animationControllers
    ///each _animationController will have same animation duration
    _animationControllers = List.generate(
      widget.numberOfDots,
      (index) {
        return AnimationController(
          vsync: this,
          duration: widget.duration,
        );
      },
    ).toList();

    ///initialization of _animations
    ///here end value is -20
    ///end value is amount of jump.
    ///and we want our dot to jump in upward direction
    for (int i = 0; i < widget.numberOfDots; i++) {
      _animations.add(Tween<double>(begin: 0, end: -widget.distance)
          .animate(_animationControllers[i]));
    }

    for (int i = 0; i < widget.numberOfDots; i++) {
      _animationControllers[i].addStatusListener((status) {
        //On Complete
        if (status == AnimationStatus.completed) {
          //return of original postion
          _animationControllers[i].reverse();
          //if it is not last dot then start the animation of next dot.
          if (i != widget.numberOfDots - 1) {
            _animationControllers[i + 1].forward();
          }
        }
        //if last dot is back to its original postion then start animation of the first dot.
        // now this animation will be repeated infinitely
        if (i == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }

    //trigger animtion of first dot to start the whole animation.
    _animationControllers.first.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * widget.numberOfDots +
          widget.distance * widget.numberOfDots,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.numberOfDots, (index) {
          //AnimatedBuilder widget will rebuild it self when
          //_animationControllers[index] value changes.
          return AnimatedBuilder(
            animation: _animationControllers[index],
            builder: (context, child) {
              return Container(
                padding: const EdgeInsets.all(2.5),
                //Transform widget's translate constructor will help us to move the dot
                //in upward direction by changing the offset of the dot.
                //X-axis position of dot will not change.
                //Only Y-axis position will change.
                child: Transform.translate(
                  offset: Offset(0, _animations[index].value),
                  child: DotWidget(
                    size: widget.size,
                    color: widget.color,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class DotWidget extends StatelessWidget {
  final Color color;
  final double size;
  const DotWidget({
    Key? key,
    this.color = Colors.white,
    this.size = 7,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      height: size,
      width: size,
    );
  }
}
