import 'package:flutter/material.dart';
import 'package:tezda_interview/utils/progress_dialog.dart';

class NewLoadingOverlay extends StatefulWidget {
  const NewLoadingOverlay({
    super.key,
    required this.body,
    this.backgroundColor,
    this.isLoading = false,
    this.isSuccesful = false,
  });

  final Widget body;
  final bool isSuccesful;

  final Color? backgroundColor;
  final bool isLoading;

  @override
  State<NewLoadingOverlay> createState() => _NewLoadingOverlayState();
}

class _NewLoadingOverlayState extends State<NewLoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus();
      },
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            widget.body,
            widget.isLoading
                ? Container(
                    color: const Color.fromRGBO(0, 0, 0, 0.85),
                    child: const Center(child: ProgressDialog()),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
