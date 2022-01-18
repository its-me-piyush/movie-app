import 'package:flutter/cupertino.dart';

import '/enumns.dart';
import '/models/top_row_models.dart';

class TopRowProvider with ChangeNotifier {
  SelectionType whatSelected = SelectionType.series;
  List<TopRowModels> items = [
    TopRowModels(
      id: '001',
      title: 'Series',
      isSelected: true,
    ),
    TopRowModels(
      id: '002',
      title: 'Movie',
      isSelected: false,
    ),
    TopRowModels(
      id: '003',
      title: 'My List',
      isSelected: false,
    ),
  ];

  List<TopRowModels> get topRowItems {
    return [...items];
  }

  void changeSelected(String id) {
    var dummy = items.firstWhere((element) => element.isSelected);
    dummy.isSelected = !dummy.isSelected;
    dummy = items.firstWhere((element) => element.id == id);
    dummy.isSelected = !dummy.isSelected;

    if (dummy.id == '001') {
      whatSelected = SelectionType.series;
    } else if (dummy.id == '002') {
      whatSelected = SelectionType.movie;
    } else {
      whatSelected = SelectionType.myList;
    }

    notifyListeners();
  }

  SelectionType getWhatSelected() {
    return whatSelected;
  }
}
