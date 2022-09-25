// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemeModel {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeModelCopyWith<ThemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeModelCopyWith<$Res> {
  factory $ThemeModelCopyWith(
          ThemeModel value, $Res Function(ThemeModel) then) =
      _$ThemeModelCopyWithImpl<$Res>;
  $Res call({String id, String imageUrl});
}

/// @nodoc
class _$ThemeModelCopyWithImpl<$Res> implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._value, this._then);

  final ThemeModel _value;
  // ignore: unused_field
  final $Res Function(ThemeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ThemeModelCopyWith<$Res>
    implements $ThemeModelCopyWith<$Res> {
  factory _$$_ThemeModelCopyWith(
          _$_ThemeModel value, $Res Function(_$_ThemeModel) then) =
      __$$_ThemeModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String imageUrl});
}

/// @nodoc
class __$$_ThemeModelCopyWithImpl<$Res> extends _$ThemeModelCopyWithImpl<$Res>
    implements _$$_ThemeModelCopyWith<$Res> {
  __$$_ThemeModelCopyWithImpl(
      _$_ThemeModel _value, $Res Function(_$_ThemeModel) _then)
      : super(_value, (v) => _then(v as _$_ThemeModel));

  @override
  _$_ThemeModel get _value => super._value as _$_ThemeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_ThemeModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ThemeModel implements _ThemeModel {
  _$_ThemeModel({required this.id, required this.imageUrl});

  @override
  final String id;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'ThemeModel(id: $id, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_ThemeModelCopyWith<_$_ThemeModel> get copyWith =>
      __$$_ThemeModelCopyWithImpl<_$_ThemeModel>(this, _$identity);
}

abstract class _ThemeModel implements ThemeModel {
  factory _ThemeModel(
      {required final String id,
      required final String imageUrl}) = _$_ThemeModel;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ThemeModelCopyWith<_$_ThemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
