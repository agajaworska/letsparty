// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetModel {
  String get id => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetModelCopyWith<BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelCopyWith<$Res> {
  factory $BudgetModelCopyWith(
          BudgetModel value, $Res Function(BudgetModel) then) =
      _$BudgetModelCopyWithImpl<$Res>;
  $Res call({String id, String data});
}

/// @nodoc
class _$BudgetModelCopyWithImpl<$Res> implements $BudgetModelCopyWith<$Res> {
  _$BudgetModelCopyWithImpl(this._value, this._then);

  final BudgetModel _value;
  // ignore: unused_field
  final $Res Function(BudgetModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BudgetModelCopyWith<$Res>
    implements $BudgetModelCopyWith<$Res> {
  factory _$$_BudgetModelCopyWith(
          _$_BudgetModel value, $Res Function(_$_BudgetModel) then) =
      __$$_BudgetModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String data});
}

/// @nodoc
class __$$_BudgetModelCopyWithImpl<$Res> extends _$BudgetModelCopyWithImpl<$Res>
    implements _$$_BudgetModelCopyWith<$Res> {
  __$$_BudgetModelCopyWithImpl(
      _$_BudgetModel _value, $Res Function(_$_BudgetModel) _then)
      : super(_value, (v) => _then(v as _$_BudgetModel));

  @override
  _$_BudgetModel get _value => super._value as _$_BudgetModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_BudgetModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BudgetModel implements _BudgetModel {
  _$_BudgetModel({required this.id, required this.data});

  @override
  final String id;
  @override
  final String data;

  @override
  String toString() {
    return 'BudgetModel(id: $id, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_BudgetModelCopyWith<_$_BudgetModel> get copyWith =>
      __$$_BudgetModelCopyWithImpl<_$_BudgetModel>(this, _$identity);
}

abstract class _BudgetModel implements BudgetModel {
  factory _BudgetModel({required final String id, required final String data}) =
      _$_BudgetModel;

  @override
  String get id;
  @override
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetModelCopyWith<_$_BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}
