part of 'request_form_bloc.dart';

const String linkUrl =
    'https://www.avito.ru/moskva_i_mo/ptitsy?bt=1&cd=1&q=%D0%BF%D0%BE%D0%BF%D1%83%D0%B3%D0%B0%D0%B9&s=104&user=1';

@freezed
class RequestFormState with _$RequestFormState {
  const factory RequestFormState({
    required bool isProcessing,
    required String url,
    required ProcessingResult result,
  }) = _RequestFormState;

  factory RequestFormState.init() {
    return RequestFormState(
      isProcessing: false,
      url: linkUrl,
      result: ProcessingResult.empty(),
    );
  }
}
