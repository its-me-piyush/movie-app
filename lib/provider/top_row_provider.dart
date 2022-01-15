import 'package:flutter/cupertino.dart';

import '/models/top_row_models.dart';

class TopRowProvider with ChangeNotifier {
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
    notifyListeners();
  }
}
