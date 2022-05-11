import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meu_site/models/repository_model.dart';

class RepositoryList {
  final List<RepositoryModel> repList;

  RepositoryList(this.repList);

  factory RepositoryList.fromJson(json) {
    //Verificar Aqui
    final listItens = (json as List).cast<Map<String, dynamic>>().map(
      (e) {
        return RepositoryModel.fromJson(e);
      },
    ).toList();
    return RepositoryList(listItens);
  }
}
