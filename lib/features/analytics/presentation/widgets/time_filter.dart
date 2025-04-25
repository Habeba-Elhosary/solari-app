// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_text_styles.dart';

class TimeFilter extends StatefulWidget {
  const TimeFilter({super.key});

  @override
  _TimeFilterState createState() => _TimeFilterState();
}

class _TimeFilterState extends State<TimeFilter> {
  final List<String> options = ['Day', 'Week', 'Month'];
  String selectedOption = 'Day';
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size buttonSize = renderBox.size;
    Offset position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy + buttonSize.height + 4,
        width: buttonSize.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, buttonSize.height + 4),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 1),
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: options.map((option) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                      });
                      _toggleDropdown();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          option,
                          style: TextStyles.regular14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedOption,
                style: TextStyles.regular14.copyWith(color: AppColors.primary),
              ),
              SizedBox(width: 8),
              Icon(Icons.keyboard_arrow_down_rounded,
                  size: 20.sp, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}
