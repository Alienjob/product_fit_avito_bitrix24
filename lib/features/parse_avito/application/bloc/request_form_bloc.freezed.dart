// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestFormState {
  bool get isProcessing => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  ProcessingResult get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestFormStateCopyWith<RequestFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestFormStateCopyWith<$Res> {
  factory $RequestFormStateCopyWith(
          RequestFormState value, $Res Function(RequestFormState) then) =
      _$RequestFormStateCopyWithImpl<$Res, RequestFormState>;
  @useResult
  $Res call({bool isProcessing, String url, ProcessingResult result});
}

/// @nodoc
class _$RequestFormStateCopyWithImpl<$Res, $Val extends RequestFormState>
    implements $RequestFormStateCopyWith<$Res> {
  _$RequestFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? url = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ProcessingResult,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestFormStateCopyWith<$Res>
    implements $RequestFormStateCopyWith<$Res> {
  factory _$$_RequestFormStateCopyWith(
          _$_RequestFormState value, $Res Function(_$_RequestFormState) then) =
      __$$_RequestFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isProcessing, String url, ProcessingResult result});
}

/// @nodoc
class __$$_RequestFormStateCopyWithImpl<$Res>
    extends _$RequestFormStateCopyWithImpl<$Res, _$_RequestFormState>
    implements _$$_RequestFormStateCopyWith<$Res> {
  __$$_RequestFormStateCopyWithImpl(
      _$_RequestFormState _value, $Res Function(_$_RequestFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? url = null,
    Object? result = null,
  }) {
    return _then(_$_RequestFormState(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ProcessingResult,
    ));
  }
}

/// @nodoc

class _$_RequestFormState implements _RequestFormState {
  const _$_RequestFormState(
      {required this.isProcessing, required this.url, required this.result});

  @override
  final bool isProcessing;
  @override
  final String url;
  @override
  final ProcessingResult result;

  @override
  String toString() {
    return 'RequestFormState(isProcessing: $isProcessing, url: $url, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestFormState &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isProcessing, url,
      const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestFormStateCopyWith<_$_RequestFormState> get copyWith =>
      __$$_RequestFormStateCopyWithImpl<_$_RequestFormState>(this, _$identity);
}

abstract class _RequestFormState implements RequestFormState {
  const factory _RequestFormState(
      {required final bool isProcessing,
      required final String url,
      required final ProcessingResult result}) = _$_RequestFormState;

  @override
  bool get isProcessing;
  @override
  String get url;
  @override
  ProcessingResult get result;
  @override
  @JsonKey(ignore: true)
  _$$_RequestFormStateCopyWith<_$_RequestFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
