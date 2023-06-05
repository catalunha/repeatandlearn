// List<CalcModel>

// Estados da tela calcs
// CalcsList com List<CalcType01>
// indexEnd
// indexCurrent
// studentResponse
// canGoToIndexPrevious
// inLastIndexCurrent

import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

@freezed
abstract class TimerResolutionState with _$TimerResolutionState {
  factory TimerResolutionState({DateTime? start, DateTime? end}) =
      _TimerResolutionState;
}
