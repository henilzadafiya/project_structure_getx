import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/utils/country_code_utils/country_code_model.dart';
import 'package:project_structure/utils/country_code_utils/country_code_utils.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';

class CountryPickerWidget extends StatefulWidget {
  final Function(CountryCodeModel value) onSelect;
  final CountryCodeModel selectedCountry;
  final bool selectionEnabled;

  const CountryPickerWidget({
    super.key,
    required this.onSelect,
    required this.selectedCountry,
    this.selectionEnabled=true
  });

  @override
  _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return getTextFieldPrefix();
  }

  Widget getTextFieldPrefix() {
    return InkWell(
      onTap: () async {
        CountryCodeUtils.openCountryCodePicker(
          context: context,
          onSelect: (p0) {
            widget.onSelect.call(p0);
          },
          selectionEnabled: widget.selectionEnabled
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            // CountryPickerUtils.getDefaultFlagImage(_selectedDialogCountry),
            3.h.verticalSpace,
            CommonText(
              string: "+${widget.selectedCountry.dialCode}",
              color: AppColors.textDefaultColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
            5.h.horizontalSpace,
            if(widget.selectionEnabled)SvgIconView(
              icon: IconAsset.arrowDown,
              color: AppColors.backArrowColor,
              size: 6.h,
            ),
            8.h.horizontalSpace,
            SizedBox(
              height: 20.h,
              child: VerticalDivider(
                color: AppColors.cardBgColor2,
                thickness: 2,
                width: 2, //thickness of divier line
              ),
            ),
            3.h.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
