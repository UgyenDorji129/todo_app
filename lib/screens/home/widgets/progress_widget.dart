import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget progressWidget(
    {context, width, height, axisColor, pointColor, value, fontSize, fontColor}) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    SizedBox(
      height: MediaQuery.of(context).size.width * height,
      width: MediaQuery.of(context).size.width * width,
      child: SfRadialGauge(axes: [
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 360,
          endAngle: 360,
          axisLineStyle: AxisLineStyle(
            thickness: 0.15,
            color: axisColor,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: [
            RangePointer(
              value: value,
              width: 0.15,
              color: pointColor,
              sizeUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.startCurve,
            )
          ],
          annotations: [
            GaugeAnnotation(
                positionFactor: 0,
                angle: 90,
                widget: Text(
                  '${value.toStringAsFixed(0)}%',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold, color: fontColor),
                ))
          ],
        ),
      ]),
    ),
  ]);
}
