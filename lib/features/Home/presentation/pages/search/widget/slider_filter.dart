import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:gap/gap.dart';

class SliderFilter extends StatelessWidget {
  const SliderFilter({
    super.key,
    required this.cubit,
  });

  final Home_Cubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.left,
              'Filter with Price :',
              style: Text_Style.getText18(
                color: App_Color.textgreydark,
              ),
            ),
          ],
        ),
        Gap(10),
        SizedBox(
          child: FlutterSlider(
            decoration: BoxDecoration(
              color: App_Color.gold2,
              borderRadius: BorderRadius.circular(15),
            ),
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(
                color:
                    App_Color
                        .goldPrimary, // لون الجزء النشط (المحدد)
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              inactiveTrackBar: BoxDecoration(
                color:
                    App_Color
                        .borderFormFiled, // لون الجزء غير المحدد
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            tooltip: FlutterSliderTooltip(
              textStyle: TextStyle(
                color:
                    App_Color.goldPrimary, // لون النص
                fontWeight: FontWeight.bold,
              ),
              boxStyle: FlutterSliderTooltipBox(
                decoration: BoxDecoration(
                  color:
                      App_Color
                          .formBackGroundColor, // خلفية النص
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            values: [
              cubit.lowerValueSearch,
              cubit.upperValueSearch,
            ],
            rangeSlider: true,
            max: 600,
            min: 0,
            onDragCompleted: (
              handlerIndex,
              lowerValue,
              upperValue,
            ) {
              cubit.lowerValueSearch = lowerValue;
              cubit.upperValueSearch = upperValue;
              cubit.getSearchData(
                cubit.searchTitle.text,
              );
            },
          ),
        ),
      ],
    );
  }
}
