// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attraction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AttractionModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttractionModelCopyWith<AttractionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionModelCopyWith<$Res> {
  factory $AttractionModelCopyWith(
          AttractionModel value, $Res Function(AttractionModel) then) =
      _$AttractionModelCopyWithImpl<$Res>;
  $Res call({String id, String title});
}

/// @nodoc
class _$AttractionModelCopyWithImpl<$Res>
    implements $AttractionModelCopyWith<$Res> {
  _$AttractionModelCopyWithImpl(this._value, this._then);

  final AttractionModel _value;
  // ignore: unused_field
  final $Res Function(AttractionModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AttractionModelCopyWith<$Res>
    implements $AttractionModelCopyWith<$Res> {
  factory _$$_AttractionModelCopyWith(
          _$_AttractionModel value, $Res Function(_$_AttractionModel) then) =
      __$$_AttractionModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title});
}

/// @nodoc
class __$$_AttractionModelCopyWithImpl<$Res>
    extends _$AttractionModelCopyWithImpl<$Res>
    implements _$$_AttractionModelCopyWith<$Res> {
  __$$_AttractionModelCopyWithImpl(
      _$_AttractionModel _value, $Res Function(_$_AttractionModel) _then)
      : super(_value, (v) => _then(v as _$_AttractionModel));

  @override
  _$_AttractionModel get _value => super._value as _$_AttractionModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_AttractionModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AttractionModel implements _AttractionModel {
  _$_AttractionModel({required this.id, required this.title});

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'AttractionModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttractionModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_AttractionModelCopyWith<_$_AttractionModel> get copyWith =>
      __$$_AttractionModelCopyWithImpl<_$_AttractionModel>(this, _$identity);
}

abstract class _AttractionModel implements AttractionModel {
  factory _AttractionModel(
      {required final String id,
      required final String title}) = _$_AttractionModel;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_AttractionModelCopyWith<_$_AttractionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
