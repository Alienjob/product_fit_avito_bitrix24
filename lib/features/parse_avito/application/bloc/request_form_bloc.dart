import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/domain/do_processing.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/domain/processing_result.dart';
part 'request_form_event.dart';
part 'request_form_state.dart';

part 'request_form_bloc.freezed.dart';

class RequestFormBloc extends Bloc<RequestFormEvent, RequestFormState> {
  RequestFormBloc() : super(RequestFormState.init()) {
    on<RequestFormEventSearch>((event, emit) async {
      emit(state.copyWith(
        isProcessing: true,
      ));
      var result = await Processor.doProcessing(state.url);
      emit(state.copyWith(
        isProcessing: false,
        result: result,
      ));
    });
    on<RequestFormEventUrlChanged>((event, emit) async {
      emit(state.copyWith(
        url: event.url,
      ));
    });
  }
}
