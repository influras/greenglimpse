import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryUtil {
  
  static List<DropdownMenuItem<String>> getAllCountries() {
    List<DropdownMenuItem<String>> countryMenuItems = [];
    for (Country c in CountryService().getAll()) {
      countryMenuItems.add(DropdownMenuItem<String>(
          value: c.name,
          child: 
             Text("${c.flagEmoji} ${c.name}"),
          ));
    }
    return countryMenuItems;
  }
}
