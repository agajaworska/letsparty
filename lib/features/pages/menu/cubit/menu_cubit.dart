import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letsparty/models/menu_model.dart';
import 'package:meta/meta.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit()
      : super(const MenuState(
          menuItems: [],
          errorMessage: '',
          isLoading: false,
        ));
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const MenuState(
        menuItems: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('menu')
        .snapshots()
        .listen((documents) {
      final menuModels = documents.docs.map(
        (doc) {
          return MenuModel(id: doc.id, title: doc['title']);
        },
      ).toList();
      emit(
        MenuState(
          menuItems: menuModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          MenuState(
            menuItems: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add({required String title}) async {
    try {
      await FirebaseFirestore.instance.collection('menu').add(
        {
          'title': title,
        },
      );
      emit(MenuState(
        menuItems: state.menuItems,
        errorMessage: '',
        isLoading: false,
      ));
    } catch (error) {
      emit(MenuState(
        menuItems: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('menu')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        MenuState(
            errorMessage: error.toString(), menuItems: [], isLoading: false),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
