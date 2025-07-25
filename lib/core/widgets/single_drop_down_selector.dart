import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_text_styles.dart';

abstract class BaseSelectableEntity extends Equatable {
  final int id;
  final String name;

  const BaseSelectableEntity({required this.id, required this.name});
  @override
  List<Object> get props => <Object>[id, name];
}

class CoreSingleSelectorDropdown<
    Cubit extends StateStreamable<CubitState>,
    CubitState,
    LoadingState extends CubitState,
    ErrorState extends CubitState,
    SelectorItem extends BaseSelectableEntity> extends StatefulWidget {
  const CoreSingleSelectorDropdown({
    super.key,
    required this.options,
    required this.onChanged,
    required this.label,
    required this.initState,
    required this.validator,
    this.initValue,
    this.hintText,
  });

  final List<SelectorItem> options;
  final Function(SelectorItem) onChanged;
  final Function() initState;
  final String? Function(SelectorItem?) validator;
  final String label;
  final SelectorItem? initValue;
  final String? hintText;

  @override
  State<
      CoreSingleSelectorDropdown<Cubit, CubitState, LoadingState, ErrorState,
          SelectorItem>> createState() => _CoreSingleSelectorDropdownState<
      Cubit, CubitState, LoadingState, ErrorState, SelectorItem>();
}

class _CoreSingleSelectorDropdownState<
        Cubit extends StateStreamable<CState>,
        CState,
        LoadingState extends CState,
        ErrorState extends CState,
        SelectorItem extends BaseSelectableEntity>
    extends State<
        CoreSingleSelectorDropdown<Cubit, CState, LoadingState, ErrorState,
            SelectorItem>> {
  @override
  void initState() {
    super.initState();
    value = widget.initValue;
    widget.initState();
  }

  @override
  void didUpdateWidget(
      covariant CoreSingleSelectorDropdown<Cubit, CState, LoadingState,
              ErrorState, SelectorItem>
          oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initValue != widget.initValue) {
      value = widget.initValue;
    }
  }

  SelectorItem? value;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubit, CState>(
      listener: (BuildContext context, state) {
        if (state is LoadingState) {
          log('Clear ====> ');
          setState(() {
            value = null;
          });
        }
      },
      builder: (BuildContext context, state) {
        if (state is ErrorState) {
          return DropdownButtonFormField<SelectorItem>(
              value: value,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              validator: (SelectorItem? value) => widget.validator(value),
              decoration: InputDecoration(
                label: Text(widget.label),
                suffixIcon: GestureDetector(
                  onTap: () => widget.initState(),
                  child: const SizedBox(
                    height: 24,
                    width: 24,
                    child: FittedBox(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(Icons.refresh),
                      ),
                    ),
                  ),
                ),
              ),
              onChanged: (Object? value) {},
              items: const <DropdownMenuItem<Never>>[]);
        }
        if (state is LoadingState) {
          return DropdownButtonFormField<SelectorItem>(
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            validator: widget.validator,
            decoration: InputDecoration(
              label: Text(widget.label),
              suffixIcon: const SizedBox(
                height: 24,
                width: 24,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            ),
            onChanged: (Object? value) {},
            items: const <DropdownMenuItem<Never>>[],
          );
        }
        return DropdownButtonFormField<SelectorItem>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: value,
          validator: widget.validator,
          decoration: InputDecoration(
            label: Text(widget.label, style: TextStyles.regular14),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: AppColors.primary, width: 1.sp),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: Color(0XFFE9ECEF), width: 1.sp),
            ),
          ),
          icon: const Icon(
            Icons.expand_more_rounded,
            color: AppColors.primary,
          ),
          onChanged: (SelectorItem? value) {
            this.value = value;
            widget.onChanged(value as SelectorItem);
          },
          // hint: Text(widget.hintText ?? '', style: TextStyles.light14),
          items: widget.options
              .map(
                (SelectorItem e) => DropdownMenuItem<SelectorItem>(
                  value: e,
                  child: Text(
                    e.name,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
