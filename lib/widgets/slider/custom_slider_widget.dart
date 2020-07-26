import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider(
      {Key key,
      this.initialValue,
      this.onChanged,
      this.min = 1,
      this.max = 5,
      this.divisions = 4,
      this.height = 50})
      : super(key: key);

  final double initialValue;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;
  final double height;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Slider(
          value: _value,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          label: '$_value',
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onChanged(value);
          }),
    );
  }
}
