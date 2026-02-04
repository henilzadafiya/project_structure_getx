import 'package:flutter/material.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/utils/country_code_utils/country_code_model.dart';
import 'package:project_structure/widget/country_picker_widget.dart';
import 'package:project_structure/widget/custom_textfeild.dart';

class CustomPhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(CountryCodeModel value) onSelect;
  final CountryCodeModel selectedCountry;
  final String? errorMessage;
  final String? labelText;
  final bool? isReadOnly;

  const CustomPhoneTextField(
      {super.key,
      required this.controller,
      this.onChanged,
      this.labelText,
      this.errorMessage,
      this.isReadOnly,
      required this.onSelect,
      required this.selectedCountry});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: S.of(context).enterYourMobile,
      keyboardType: TextInputType.phone,
      labelText: labelText ?? S.of(context).mobileNumber,
      onChanged: onChanged,
      readOnly: isReadOnly ?? false,
      errorMessage: errorMessage,
      maxLength: selectedCountry.maxLength,
      prefix: CountryPickerWidget(
        selectedCountry: selectedCountry,
        onSelect: onSelect,
        selectionEnabled: isReadOnly == true ? false : true,
      ),
    );
  }
}
