import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          index: 1,
          gNavItem: GNavItem.home,
        ));
  void onTapPressed(GNavItem gNavItem) {
    switch (gNavItem) {
      case GNavItem.home:
        emit(
          const HomeState(index: 1, gNavItem: GNavItem.home),
        );
        break;
      case GNavItem.account:
        emit(const HomeState(index: 0, gNavItem: GNavItem.account));
        break;
      case GNavItem.chat:
        emit(
          const HomeState(index: 2, gNavItem: GNavItem.chat),
        );
        break;
    }
  }
}
