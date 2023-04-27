import 'package:education_app2/screens/home/question_card.dart';
import 'package:education_app2/widgets/common/background_decoration.dart';
import 'package:education_app2/widgets/common/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionCard> {
  const TestOverviewScreen({super.key});

  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Test Overview Menu",
      ),
      body: BackgroundDecoration(
        child: Center(
          child: Text(
            "Test ",
          ),
        ),
      ),
    );
  }
}
