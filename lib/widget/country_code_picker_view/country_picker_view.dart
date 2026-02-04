import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/utils/country_code_utils/country_code_model.dart';
import 'package:project_structure/utils/country_code_utils/country_code_utils.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_textfeild.dart';

class CountryPickerView extends StatefulWidget {
  final Function(CountryCodeModel selectedNewValue) onSelect;

  const CountryPickerView({
    super.key,
    required this.onSelect,
  });

  @override
  State<CountryPickerView> createState() => _CountryPickerViewState();
}

class _CountryPickerViewState extends State<CountryPickerView> {
  final TextEditingController searchTextController = TextEditingController();

  RxList<CountryCodeModel> _countryCodeList = CountryCodeUtils.countryCodeList.toList().obs;

  void onSearchTextChange(String value) {
    if (value.isNotEmpty) {
      _countryCodeList.value = CountryCodeUtils.countryCodeList
          .where(
            (element) => (element.name.toLowerCase().contains(value)) || ("+${element.dialCode.toLowerCase()}".contains(value)),
          )
          .toList();
    } else {
      _countryCodeList.value = CountryCodeUtils.countryCodeList.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextField(

            controller: searchTextController,
            onChanged: onSearchTextChange,
            hintText: S.of(context).searchYourCountry,
            prefix: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIconView(
                  icon: IconAsset.search_icon,
                  size: 18.h,
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 4.h, bottom: 20.h),
                itemCount: _countryCodeList.length,
                itemBuilder: (context, index) {
                  final CountryCodeModel cardData = _countryCodeList[index];
                  return GestureDetector(
                    onTap: () {
                      widget.onSelect.call(cardData);
                      Navigation.pop();
                    },
                    child: Container(
                      color: AppColors.transparentColor,
                      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                      child: Row(
                        children: [
                          CommonText(
                            string: cardData.flag,
                            fontSize: 16.sp,
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: CommonText(
                              string: cardData.name,
                              fontSize: 16.sp,
                              softWrap: true,
                            ),
                          ),
                          12.horizontalSpace,
                          CommonText(
                            string: "+${cardData.dialCode}",
                            fontSize: 16.sp,
                            color: AppColors.textDefaultColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
