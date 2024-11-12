import 'package:tezda_interview/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        size: 20,
        color: AppTheme.primaryColor,
        secondRingColor: AppTheme.secondaryColor,
        thirdRingColor: AppTheme.accent,
      ),
    );
  }
}
