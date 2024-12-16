//Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
// My classes
import 'package:metrok/data/stations_names.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class StationsDropdown extends StatelessWidget {
  final String? selectedStation;
  final String defaultHintText;
  final OnSelectionChanged<String>? onSelectionChange;

  const StationsDropdown({
    super.key,
    required this.selectedStation,
    required this.defaultHintText,
    required this.onSelectionChange,
  });

  @override
  Widget build(BuildContext context) {
    return MultiDropdown<String>(
      fieldDecoration: _buildFieldDecoration(
        selectedStation == '' || selectedStation!.isEmpty
            ? defaultHintText.tr
            : selectedStation!.tr,
      ),
      searchDecoration: _buildSearchDecoration('Search'.tr),
      singleSelect: true,
      searchEnabled: true,
      onSelectionChange: onSelectionChange,
      items: StationsNames.allStationsLines
          .map((station) => DropdownItem<String>(
                value: station,
                label: station.tr,
              ))
          .toList(),
    );
  }

  FieldDecoration _buildFieldDecoration(String hintText) {
    return FieldDecoration(
      hintText: hintText,
      borderRadius: 10,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightGrey,
        ),
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        fontFamily: SelectFontFamily.getFontFamily(),
        fontWeight: FontWeight.w300,
      ),
    );
  }

  SearchFieldDecoration _buildSearchDecoration(String hintText) {
    return SearchFieldDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}