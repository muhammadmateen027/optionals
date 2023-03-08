import 'package:flutter/material.dart';
import 'package:helper_options/helper_options.dart';

// ignore_for_file: avoid_final_parameters
// ignore_for_file: public_member_api_docs

class OptionWidget<T> extends StatelessWidget {
  const OptionWidget({
    required this.option,
    required this.builder,
    Key? key,
    this.empty = const SizedBox(),
  }) : super(key: key);

  final Option<T> option;

  final Widget Function(BuildContext context, T value) builder;

  final Widget empty;

  @override
  Widget build(final BuildContext context) {
    return option.isPresent ? builder(context, option.value) : empty;
  }
}
