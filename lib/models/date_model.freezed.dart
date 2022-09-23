// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'date_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DateModel {
  String get id => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get adress => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateModelCopyWith<DateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateModelCopyWith<$Res> {
  factory $DateModelCopyWith(DateModel value, $Res Function(DateModel) then) =
      _$DateModelCopyWithImpl<$Res>;
  $Res call(
      {String id, String city, String adress, DateTime date, String time});
}

/// @nodoc
class _$DateModelCopyWithImpl<$Res> implements $DateModelCopyWith<$Res> {
  _$DateModelCopyWithImpl(this._value, this._then);

  final DateModel _value;
  // ignore: unused_field
  final $Res Function(DateModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? city = freezed,
    Object? adress = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      adress: adress == freezed
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DateModelCopyWith<$Res> implements $DateModelCopyWith<$Res> {
  factory _$$_DateModelCopyWith(
          _$_DateModel value, $Res Function(_$_DateModel) then) =
      __$$_DateModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String city, String adress, DateTime date, String time});
}

/// @nodoc
class __$$_DateModelCopyWithImpl<$Res> extends _$DateModelCopyWithImpl<$Res>
    implements _$$_DateModelCopyWith<$Res> {
  __$$_DateModelCopyWithImpl(
      _$_DateModel _value, $Res Function(_$_DateModel) _then)
      : super(_value, (v) => _then(v as _$_DateModel));

  @override
  _$_DateModel get _value => super._value as _$_DateModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? city = freezed,
    Object? adress = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_DateModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      adress: adress == freezed
          ? _value.adress
          : adress // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DateModel extends _DateModel {
  _$_DateModel(
      {required this.id,
      required this.city,
      required this.adress,
      required this.date,
      required this.time})
      : super._();

  @override
  final String id;
  @override
  final String city;
  @override
  final String adress;
  @override
  final DateTime date;
  @override
  final String time;

  @override
  String toString() {
    return 'DateModel(id: $id, city: $city, adress: $adress, date: $date, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DateModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.adress, adress) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(adress),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_DateModelCopyWith<_$_DateModel> get copyWith =>
      __$$_DateModelCopyWithImpl<_$_DateModel>(this, _$identity);
}

abstract class _DateModel extends DateModel {
  factory _DateModel(
      {required final String id,
      required final String city,
      required final String adress,
      required final DateTime date,
      required final String time}) = _$_DateModel;
  _DateModel._() : super._();

  @override
  String get id;
  @override
  String get city;
  @override
  String get adress;
  @override
  DateTime get date;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_DateModelCopyWith<_$_DateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
