import 'package:education_app2/configs/themes/app_colors.dart';
import 'package:education_app2/configs/themes/ui_parameters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard({
    super.key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceTextColor : null,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: isSelected
                ? answerSelectedColor()
                : Theme.of(context).cardColor,
            border: Border.all(
              color: isSelected ? answerSelectedColor() : answerBorderColor(),
            )),
      ),
    );
  }
}
