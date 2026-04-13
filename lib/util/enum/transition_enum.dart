enum TransitionEnum {
  leftToCenter(
    displayValue: 'Left To Center',
    transition: 'leftToCenter',
    cmd: _leftToRight,
  ),
  topToCenter(
    displayValue: 'Top to Center',
    transition: 'rightToCenter',
    cmd: _topToBottom,
  ),
  rightToCenter(
    displayValue: 'Right to Center',
    transition: 'rightToCenter',
    cmd: _rightToRight,
  ),
  bottomToCenter(
    displayValue: 'Bottom to Center',
    transition: 'rightToCenter',
    cmd: _bottomToTop,
  );

  const TransitionEnum({
    required this.displayValue,
    required this.transition,
    required this.cmd,
  });

  final String transition;
  final Function(double x, double y) cmd;
  final String displayValue;
}

String _leftToRight(double x, double y) {
  return 'x=if(lt(t,2), -tw + pow(t/2, 1.5)*($x + tw), $x):y=$y';
}

String _rightToRight(double x, double y) {
  return 'x=if(lt(t,2), w - pow(t/2,1.5)*(w - $x), $x):y=$y';
}

String _topToBottom(double x, double y) {
  return 'x=$x:y=if(lt(t,2), -th + pow(t/2,1.5)*($y + th), $y)';
}

String _bottomToTop(double x, double y) {
  return 'x=$x:y=if(lt(t,2), h - pow(t/2,1.5)*(h - $y), $y)';
}
