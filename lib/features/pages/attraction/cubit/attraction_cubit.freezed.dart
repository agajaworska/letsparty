// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attraction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AttractionState {
  List<AttractionModel> get documents => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttractionStateCopyWith<AttractionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionStateCopyWith<$Res> {
  factory $AttractionStateCopyWith(
          AttractionState value, $Res Function(AttractionState) then) =
      _$AttractionStateCopyWithImpl<$Res>;
  $Res call(
      {List<AttractionModel> documents, Status status, String? errorMessage});
}

/// @nodoc
class _$AttractionStateCopyWithImpl<$Res>
    implements $AttractionStateCopyWith<$Res> {
  _$AttractionStateCopyWithImpl(this._value, this._then);

  final AttractionState _value;
  // ignore: unused_field
  final $Res Function(AttractionState) _then;

  @override
  $Res call({
    Object? documents = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<AttractionModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AttractionStateCopyWith<$Res>
    implements $AttractionStateCopyWith<$Res> {
  factory _$$_AttractionStateCopyWith(
          _$_AttractionState value, $Res Function(_$_AttractionState) then) =
      __$$_AttractionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<AttractionModel> documents, Status status, String? errorMessage});
}

/// @nodoc
class __$$_AttractionStateCopyWithImpl<$Res>
    extends _$AttractionStateCopyWithImpl<$Res>
    implements _$$_AttractionStateCopyWith<$Res> {
  __$$_AttractionStateCopyWithImpl(
      _$_AttractionState _value, $Res Function(_$_AttractionState) _then)
      : super(_value, (v) => _then(v as _$_AttractionState));

  @override
  _$_AttractionState get _value => super._value as _$_AttractionState;

  @override
  $Res call({
    Object? documents = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AttractionState(
      documents: documents == freezed
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<AttractionModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AttractionState implements _AttractionState {
  _$_AttractionState(
      {final List<AttractionModel> documents = const [],
      this.status = Status.initial,
      this.errorMessage})
      : _documents = documents;

  final List<AttractionModel> _documents;
  @override
  @JsonKey()
  List<AttractionModel> get documents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AttractionState(documents: $documents, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttractionState &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_documents),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_AttractionStateCopyWith<_$_AttractionState> get copyWith =>
      __$$_AttractionStateCopyWithImpl<_$_AttractionState>(this, _$identity);
}

abstract class _AttractionState implements AttractionState {
  factory _AttractionState(
      {final List<AttractionModel> documents,
      final Status status,
      final String? errorMessage}) = _$_AttractionState;

  @override
  List<AttractionModel> get documents;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AttractionStateCopyWith<_$_AttractionState> get copyWith =>
      throw _privateConstructorUsedError;
}
