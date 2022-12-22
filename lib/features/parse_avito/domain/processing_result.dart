import 'package:freezed_annotation/freezed_annotation.dart';

part 'processing_result.freezed.dart';

@freezed
class ProcessingResult with _$ProcessingResult {
  const factory ProcessingResult({
    required bool succesGetURL,
    required bool dbConnected,
    required bool bitrix24Connected,
    required int step,
    required int pages,
    required int elements,
    required int newElements,
    required int parsedElements,
    required int sendedElements,
  }) = _ProcessingResult;

  factory ProcessingResult.empty() {
    return const ProcessingResult(
      succesGetURL: false,
      dbConnected: false,
      bitrix24Connected: false,
      step: 1,
      pages: 0,
      elements: 0,
      newElements: 0,
      parsedElements: 0,
      sendedElements: 0,
    );
  }
}
