// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'addSpendings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddSpendingsModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddSpendingsModelCopyWith<AddSpendingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSpendingsModelCopyWith<$Res> {
  factory $AddSpendingsModelCopyWith(
          AddSpendingsModel value, $Res Function(AddSpendingsModel) then) =
      _$AddSpendingsModelCopyWithImpl<$Res>;
  $Res call({String id, String name, String price});
}

/// @nodoc
class _$AddSpendingsModelCopyWithImpl<$Res>
    implements $AddSpendingsModelCopyWith<$Res> {
  _$AddSpendingsModelCopyWithImpl(this._value, this._then);

  final AddSpendingsModel _value;
  // ignore: unused_field
  final $Res Function(AddSpendingsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddSpendingsModelCopyWith<$Res>
    implements $AddSpendingsModelCopyWith<$Res> {
  factory _$$_AddSpendingsModelCopyWith(_$_AddSpendingsModel value,
          $Res Function(_$_AddSpendingsModel) then) =
      __$$_AddSpendingsModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String price});
}

/// @nodoc
class __$$_AddSpendingsModelCopyWithImpl<$Res>
    extends _$AddSpendingsModelCopyWithImpl<$Res>
    implements _$$_AddSpendingsModelCopyWith<$Res> {
  __$$_AddSpendingsModelCopyWithImpl(
      _$_AddSpendingsModel _value, $Res Function(_$_AddSpendingsModel) _then)
      : super(_value, (v) => _then(v as _$_AddSpendingsModel));

  @override
  _$_AddSpendingsModel get _value => super._value as _$_AddSpendingsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_AddSpendingsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddSpendingsModel implements _AddSpendingsModel {
  _$_AddSpendingsModel(
      {required this.id, required this.name, required this.price});

  @override
  final String id;
  @override
  final String name;
  @override
  final String price;

  @override
  String toString() {
    return 'AddSpendingsModel(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddSpendingsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_AddSpendingsModelCopyWith<_$_AddSpendingsModel> get copyWith =>
      __$$_AddSpendingsModelCopyWithImpl<_$_AddSpendingsModel>(
          this, _$identity);
}

abstract class _AddSpendingsModel implements AddSpendingsModel {
  factory _AddSpendingsModel(
      {required final String id,
      required final String name,
      required final String price}) = _$_AddSpendingsModel;

  @override
  String get id;
  @override
  String get name;
  @override
  String get price;
  @override
  @JsonKey(ignore: true)
  _$$_AddSpendingsModelCopyWith<_$_AddSpendingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
