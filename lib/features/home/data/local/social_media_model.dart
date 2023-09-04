import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DrawerItemModel extends Equatable {
  final String name;
  final String url;
  final Icon icon;

  const DrawerItemModel(this.name, this.icon, this.url);

  @override
  List<Object?> get props => [name, url, icon];
}
