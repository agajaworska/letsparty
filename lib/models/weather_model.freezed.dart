// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  LocationModel get location => throw _privateConstructorUsedError;
  CurrentModel get current => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res>;
  $Res call({LocationModel location, CurrentModel current});

  $LocationModelCopyWith<$Res> get location;
  $CurrentModelCopyWith<$Res> get current;
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res> implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  final WeatherModel _value;
  // ignore: unused_field
  final $Res Function(WeatherModel) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? current = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as CurrentModel,
    ));
  }

  @override
  $LocationModelCopyWith<$Res> get location {
    return $LocationModelCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $CurrentModelCopyWith<$Res> get current {
    return $CurrentModelCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value));
    });
  }
}

/// @nodoc
abstract class _$$_WeatherModelCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$_WeatherModelCopyWith(
          _$_WeatherModel value, $Res Function(_$_WeatherModel) then) =
      __$$_WeatherModelCopyWithImpl<$Res>;
  @override
  $Res call({LocationModel location, CurrentModel current});

  @override
  $LocationModelCopyWith<$Res> get location;
  @override
  $CurrentModelCopyWith<$Res> get current;
}

/// @nodoc
class __$$_WeatherModelCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res>
    implements _$$_WeatherModelCopyWith<$Res> {
  __$$_WeatherModelCopyWithImpl(
      _$_WeatherModel _value, $Res Function(_$_WeatherModel) _then)
      : super(_value, (v) => _then(v as _$_WeatherModel));

  @override
  _$_WeatherModel get _value => super._value as _$_WeatherModel;

  @override
  $Res call({
    Object? location = freezed,
    Object? current = freezed,
  }) {
    return _then(_$_WeatherModel(
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as CurrentModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherModel implements _WeatherModel {
  _$_WeatherModel(this.location, this.current);

  factory _$_WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherModelFromJson(json);

  @override
  final LocationModel location;
  @override
  final CurrentModel current;

  @override
  String toString() {
    return 'WeatherModel(location: $location, current: $current)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherModel &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.current, current));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(current));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      __$$_WeatherModelCopyWithImpl<_$_WeatherModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherModelToJson(
      this,
    );
  }
}

abstract class _WeatherModel implements WeatherModel {
  factory _WeatherModel(
          final LocationModel location, final CurrentModel current) =
      _$_WeatherModel;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$_WeatherModel.fromJson;

  @override
  LocationModel get location;
  @override
  CurrentModel get current;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  final LocationModel _value;
  // ignore: unused_field
  final $Res Function(LocationModel) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LocationModelCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$_LocationModelCopyWith(
          _$_LocationModel value, $Res Function(_$_LocationModel) then) =
      __$$_LocationModelCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$$_LocationModelCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res>
    implements _$$_LocationModelCopyWith<$Res> {
  __$$_LocationModelCopyWithImpl(
      _$_LocationModel _value, $Res Function(_$_LocationModel) _then)
      : super(_value, (v) => _then(v as _$_LocationModel));

  @override
  _$_LocationModel get _value => super._value as _$_LocationModel;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_LocationModel(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationModel implements _LocationModel {
  _$_LocationModel(this.name);

  factory _$_LocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocationModelFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'LocationModel(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationModel &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_LocationModelCopyWith<_$_LocationModel> get copyWith =>
      __$$_LocationModelCopyWithImpl<_$_LocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationModelToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  factory _LocationModel(final String name) = _$_LocationModel;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$_LocationModel.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_LocationModelCopyWith<_$_LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) {
  return _CurrentModel.fromJson(json);
}

/// @nodoc
mixin _$CurrentModel {
  @JsonKey(name: 'temp_c')
  double get temperature => throw _privateConstructorUsedError;
  ConditionModel get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentModelCopyWith<CurrentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentModelCopyWith<$Res> {
  factory $CurrentModelCopyWith(
          CurrentModel value, $Res Function(CurrentModel) then) =
      _$CurrentModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'temp_c') double temperature, ConditionModel condition});

  $ConditionModelCopyWith<$Res> get condition;
}

/// @nodoc
class _$CurrentModelCopyWithImpl<$Res> implements $CurrentModelCopyWith<$Res> {
  _$CurrentModelCopyWithImpl(this._value, this._then);

  final CurrentModel _value;
  // ignore: unused_field
  final $Res Function(CurrentModel) _then;

  @override
  $Res call({
    Object? temperature = freezed,
    Object? condition = freezed,
  }) {
    return _then(_value.copyWith(
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ConditionModel,
    ));
  }

  @override
  $ConditionModelCopyWith<$Res> get condition {
    return $ConditionModelCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value));
    });
  }
}

/// @nodoc
abstract class _$$_CurrentModelCopyWith<$Res>
    implements $CurrentModelCopyWith<$Res> {
  factory _$$_CurrentModelCopyWith(
          _$_CurrentModel value, $Res Function(_$_CurrentModel) then) =
      __$$_CurrentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'temp_c') double temperature, ConditionModel condition});

  @override
  $ConditionModelCopyWith<$Res> get condition;
}

/// @nodoc
class __$$_CurrentModelCopyWithImpl<$Res>
    extends _$CurrentModelCopyWithImpl<$Res>
    implements _$$_CurrentModelCopyWith<$Res> {
  __$$_CurrentModelCopyWithImpl(
      _$_CurrentModel _value, $Res Function(_$_CurrentModel) _then)
      : super(_value, (v) => _then(v as _$_CurrentModel));

  @override
  _$_CurrentModel get _value => super._value as _$_CurrentModel;

  @override
  $Res call({
    Object? temperature = freezed,
    Object? condition = freezed,
  }) {
    return _then(_$_CurrentModel(
      temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ConditionModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrentModel implements _CurrentModel {
  _$_CurrentModel(@JsonKey(name: 'temp_c') this.temperature, this.condition);

  factory _$_CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentModelFromJson(json);

  @override
  @JsonKey(name: 'temp_c')
  final double temperature;
  @override
  final ConditionModel condition;

  @override
  String toString() {
    return 'CurrentModel(temperature: $temperature, condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentModel &&
            const DeepCollectionEquality()
                .equals(other.temperature, temperature) &&
            const DeepCollectionEquality().equals(other.condition, condition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(temperature),
      const DeepCollectionEquality().hash(condition));

  @JsonKey(ignore: true)
  @override
  _$$_CurrentModelCopyWith<_$_CurrentModel> get copyWith =>
      __$$_CurrentModelCopyWithImpl<_$_CurrentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentModelToJson(
      this,
    );
  }
}

abstract class _CurrentModel implements CurrentModel {
  factory _CurrentModel(@JsonKey(name: 'temp_c') final double temperature,
      final ConditionModel condition) = _$_CurrentModel;

  factory _CurrentModel.fromJson(Map<String, dynamic> json) =
      _$_CurrentModel.fromJson;

  @override
  @JsonKey(name: 'temp_c')
  double get temperature;
  @override
  ConditionModel get condition;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentModelCopyWith<_$_CurrentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ConditionModel _$ConditionModelFromJson(Map<String, dynamic> json) {
  return _ConditionModel.fromJson(json);
}

/// @nodoc
mixin _$ConditionModel {
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConditionModelCopyWith<ConditionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionModelCopyWith<$Res> {
  factory $ConditionModelCopyWith(
          ConditionModel value, $Res Function(ConditionModel) then) =
      _$ConditionModelCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$ConditionModelCopyWithImpl<$Res>
    implements $ConditionModelCopyWith<$Res> {
  _$ConditionModelCopyWithImpl(this._value, this._then);

  final ConditionModel _value;
  // ignore: unused_field
  final $Res Function(ConditionModel) _then;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ConditionModelCopyWith<$Res>
    implements $ConditionModelCopyWith<$Res> {
  factory _$$_ConditionModelCopyWith(
          _$_ConditionModel value, $Res Function(_$_ConditionModel) then) =
      __$$_ConditionModelCopyWithImpl<$Res>;
  @override
  $Res call({String text});
}

/// @nodoc
class __$$_ConditionModelCopyWithImpl<$Res>
    extends _$ConditionModelCopyWithImpl<$Res>
    implements _$$_ConditionModelCopyWith<$Res> {
  __$$_ConditionModelCopyWithImpl(
      _$_ConditionModel _value, $Res Function(_$_ConditionModel) _then)
      : super(_value, (v) => _then(v as _$_ConditionModel));

  @override
  _$_ConditionModel get _value => super._value as _$_ConditionModel;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ConditionModel(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConditionModel implements _ConditionModel {
  _$_ConditionModel(this.text);

  factory _$_ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConditionModelFromJson(json);

  @override
  final String text;

  @override
  String toString() {
    return 'ConditionModel(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConditionModel &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_ConditionModelCopyWith<_$_ConditionModel> get copyWith =>
      __$$_ConditionModelCopyWithImpl<_$_ConditionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConditionModelToJson(
      this,
    );
  }
}

abstract class _ConditionModel implements ConditionModel {
  factory _ConditionModel(final String text) = _$_ConditionModel;

  factory _ConditionModel.fromJson(Map<String, dynamic> json) =
      _$_ConditionModel.fromJson;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_ConditionModelCopyWith<_$_ConditionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
