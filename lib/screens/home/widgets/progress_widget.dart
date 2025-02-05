import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget progressWidget(context){
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
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
                      color: const Color.fromARGB(98, 211, 207, 207),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: [
                      RangePointer(
                        value: 80,
                        width: 0.15,
                        color: Colors.white,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.startCurve,
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                          positionFactor: 0,
                          angle: 90,
                          widget: Text(
                            '${80.toStringAsFixed(0)}%',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ]),
              ),
            ]);
}