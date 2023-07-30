//
//  Generated code. Do not modify.
//  source: matches.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use formatDescriptor instead')
const Format$json = {
  '1': 'Format',
  '2': [
    {'1': 'BEST_OF_ONE', '2': 0},
    {'1': 'TIEBREAK_TO_TEN', '2': 1},
    {'1': 'BEST_OF_THREE', '2': 2},
    {'1': 'BEST_OF_THREE_FST', '2': 3},
    {'1': 'BEST_OF_FIVE', '2': 4},
    {'1': 'BEST_OF_FIVE_FST', '2': 5},
    {'1': 'FAST4', '2': 6},
  ],
};

/// Descriptor for `Format`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List formatDescriptor = $convert.base64Decode(
    'CgZGb3JtYXQSDwoLQkVTVF9PRl9PTkUQABITCg9USUVCUkVBS19UT19URU4QARIRCg1CRVNUX0'
    '9GX1RIUkVFEAISFQoRQkVTVF9PRl9USFJFRV9GU1QQAxIQCgxCRVNUX09GX0ZJVkUQBBIUChBC'
    'RVNUX09GX0ZJVkVfRlNUEAUSCQoFRkFTVDQQBg==');

@$core.Deprecated('Use teamDescriptor instead')
const Team$json = {
  '1': 'Team',
  '2': [
    {'1': 'TEAM_ONE', '2': 0},
    {'1': 'TEAM_TWO', '2': 1},
  ],
};

/// Descriptor for `Team`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List teamDescriptor = $convert.base64Decode(
    'CgRUZWFtEgwKCFRFQU1fT05FEAASDAoIVEVBTV9UV08QAQ==');

@$core.Deprecated('Use configureErrorDescriptor instead')
const ConfigureError$json = {
  '1': 'ConfigureError',
  '2': [
    {'1': 'CONFIGURE_ERROR_UNKNOWN', '2': 0},
  ],
};

/// Descriptor for `ConfigureError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List configureErrorDescriptor = $convert.base64Decode(
    'Cg5Db25maWd1cmVFcnJvchIbChdDT05GSUdVUkVfRVJST1JfVU5LTk9XThAA');

@$core.Deprecated('Use addPointErrorDescriptor instead')
const AddPointError$json = {
  '1': 'AddPointError',
  '2': [
    {'1': 'ADD_POINT_UNKNOWN', '2': 0},
    {'1': 'ADD_POINT_DOES_NOT_EXIST', '2': 1},
    {'1': 'ADD_POINT_IS_COMPLETE', '2': 2},
  ],
};

/// Descriptor for `AddPointError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List addPointErrorDescriptor = $convert.base64Decode(
    'Cg1BZGRQb2ludEVycm9yEhUKEUFERF9QT0lOVF9VTktOT1dOEAASHAoYQUREX1BPSU5UX0RPRV'
    'NfTk9UX0VYSVNUEAESGQoVQUREX1BPSU5UX0lTX0NPTVBMRVRFEAI=');

@$core.Deprecated('Use undoPointErrorDescriptor instead')
const UndoPointError$json = {
  '1': 'UndoPointError',
  '2': [
    {'1': 'UNDO_POINT_UNKNOWN', '2': 0},
    {'1': 'UNDO_POINT_NOTHING_TO_UNDO', '2': 1},
  ],
};

/// Descriptor for `UndoPointError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List undoPointErrorDescriptor = $convert.base64Decode(
    'Cg5VbmRvUG9pbnRFcnJvchIWChJVTkRPX1BPSU5UX1VOS05PV04QABIeChpVTkRPX1BPSU5UX0'
    '5PVEhJTkdfVE9fVU5ETxAB');

@$core.Deprecated('Use getSummaryErrorDescriptor instead')
const GetSummaryError$json = {
  '1': 'GetSummaryError',
  '2': [
    {'1': 'GET_SUMMARY_MATCH_DOES_NOT_EXIST', '2': 0},
    {'1': 'GET_SUMMARY_UNKNOWN', '2': 1},
  ],
};

/// Descriptor for `GetSummaryError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List getSummaryErrorDescriptor = $convert.base64Decode(
    'Cg9HZXRTdW1tYXJ5RXJyb3ISJAogR0VUX1NVTU1BUllfTUFUQ0hfRE9FU19OT1RfRVhJU1QQAB'
    'IXChNHRVRfU1VNTUFSWV9VTktOT1dOEAE=');

@$core.Deprecated('Use configureRequestDescriptor instead')
const ConfigureRequest$json = {
  '1': 'ConfigureRequest',
  '2': [
    {'1': 'format', '3': 1, '4': 1, '5': 14, '6': '.RacketReel.Format', '10': 'format'},
    {'1': 'serving_first', '3': 2, '4': 1, '5': 14, '6': '.RacketReel.Team', '10': 'servingFirst'},
    {'1': 'team_one_name', '3': 4, '4': 1, '5': 9, '10': 'teamOneName'},
    {'1': 'team_two_name', '3': 6, '4': 1, '5': 9, '10': 'teamTwoName'},
  ],
};

/// Descriptor for `ConfigureRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configureRequestDescriptor = $convert.base64Decode(
    'ChBDb25maWd1cmVSZXF1ZXN0EioKBmZvcm1hdBgBIAEoDjISLlJhY2tldFJlZWwuRm9ybWF0Ug'
    'Zmb3JtYXQSNQoNc2VydmluZ19maXJzdBgCIAEoDjIQLlJhY2tldFJlZWwuVGVhbVIMc2Vydmlu'
    'Z0ZpcnN0EiIKDXRlYW1fb25lX25hbWUYBCABKAlSC3RlYW1PbmVOYW1lEiIKDXRlYW1fdHdvX2'
    '5hbWUYBiABKAlSC3RlYW1Ud29OYW1l');

@$core.Deprecated('Use configureReplyDescriptor instead')
const ConfigureReply$json = {
  '1': 'ConfigureReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.RacketReel.ConfigureError', '9': 0, '10': 'error', '17': true},
    {'1': 'match_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'matchId', '17': true},
  ],
  '8': [
    {'1': '_error'},
    {'1': '_match_id'},
  ],
};

/// Descriptor for `ConfigureReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configureReplyDescriptor = $convert.base64Decode(
    'Cg5Db25maWd1cmVSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEjUKBWVycm9yGAIgAS'
    'gOMhouUmFja2V0UmVlbC5Db25maWd1cmVFcnJvckgAUgVlcnJvcogBARIeCghtYXRjaF9pZBgD'
    'IAEoCUgBUgdtYXRjaElkiAEBQggKBl9lcnJvckILCglfbWF0Y2hfaWQ=');

@$core.Deprecated('Use addPointRequestDescriptor instead')
const AddPointRequest$json = {
  '1': 'AddPointRequest',
  '2': [
    {'1': 'match_id', '3': 1, '4': 1, '5': 5, '10': 'matchId'},
    {'1': 'team', '3': 2, '4': 1, '5': 14, '6': '.RacketReel.Team', '10': 'team'},
  ],
};

/// Descriptor for `AddPointRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPointRequestDescriptor = $convert.base64Decode(
    'Cg9BZGRQb2ludFJlcXVlc3QSGQoIbWF0Y2hfaWQYASABKAVSB21hdGNoSWQSJAoEdGVhbRgCIA'
    'EoDjIQLlJhY2tldFJlZWwuVGVhbVIEdGVhbQ==');

@$core.Deprecated('Use addPointReplyDescriptor instead')
const AddPointReply$json = {
  '1': 'AddPointReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.RacketReel.AddPointError', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `AddPointReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPointReplyDescriptor = $convert.base64Decode(
    'Cg1BZGRQb2ludFJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSNAoFZXJyb3IYAiABKA'
    '4yGS5SYWNrZXRSZWVsLkFkZFBvaW50RXJyb3JIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');

@$core.Deprecated('Use undoPointRequestDescriptor instead')
const UndoPointRequest$json = {
  '1': 'UndoPointRequest',
  '2': [
    {'1': 'match_id', '3': 1, '4': 1, '5': 5, '10': 'matchId'},
  ],
};

/// Descriptor for `UndoPointRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undoPointRequestDescriptor = $convert.base64Decode(
    'ChBVbmRvUG9pbnRSZXF1ZXN0EhkKCG1hdGNoX2lkGAEgASgFUgdtYXRjaElk');

@$core.Deprecated('Use undoPointReplyDescriptor instead')
const UndoPointReply$json = {
  '1': 'UndoPointReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.RacketReel.UndoPointError', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `UndoPointReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undoPointReplyDescriptor = $convert.base64Decode(
    'Cg5VbmRvUG9pbnRSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEjUKBWVycm9yGAIgAS'
    'gOMhouUmFja2V0UmVlbC5VbmRvUG9pbnRFcnJvckgAUgVlcnJvcogBAUIICgZfZXJyb3I=');

@$core.Deprecated('Use getSummaryRequestDescriptor instead')
const GetSummaryRequest$json = {
  '1': 'GetSummaryRequest',
  '2': [
    {'1': 'match_id', '3': 1, '4': 1, '5': 5, '10': 'matchId'},
  ],
};

/// Descriptor for `GetSummaryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSummaryRequestDescriptor = $convert.base64Decode(
    'ChFHZXRTdW1tYXJ5UmVxdWVzdBIZCghtYXRjaF9pZBgBIAEoBVIHbWF0Y2hJZA==');

@$core.Deprecated('Use getSummaryReplyDescriptor instead')
const GetSummaryReply$json = {
  '1': 'GetSummaryReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.RacketReel.GetSummaryError', '9': 0, '10': 'error', '17': true},
    {'1': 'summary', '3': 3, '4': 1, '5': 11, '6': '.RacketReel.Summary', '9': 1, '10': 'summary', '17': true},
  ],
  '8': [
    {'1': '_error'},
    {'1': '_summary'},
  ],
};

/// Descriptor for `GetSummaryReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSummaryReplyDescriptor = $convert.base64Decode(
    'Cg9HZXRTdW1tYXJ5UmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxI2CgVlcnJvchgCIA'
    'EoDjIbLlJhY2tldFJlZWwuR2V0U3VtbWFyeUVycm9ySABSBWVycm9yiAEBEjIKB3N1bW1hcnkY'
    'AyABKAsyEy5SYWNrZXRSZWVsLlN1bW1hcnlIAVIHc3VtbWFyeYgBAUIICgZfZXJyb3JCCgoIX3'
    'N1bW1hcnk=');

@$core.Deprecated('Use summaryDescriptor instead')
const Summary$json = {
  '1': 'Summary',
  '2': [
    {'1': 'match_id', '3': 1, '4': 1, '5': 5, '10': 'matchId'},
    {'1': 'started_at_utc', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startedAtUtc'},
    {'1': 'completed_at_utc', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAtUtc'},
    {'1': 'duration', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    {'1': 'format', '3': 5, '4': 1, '5': 14, '6': '.RacketReel.Format', '10': 'format'},
    {'1': 'set_one', '3': 7, '4': 1, '5': 11, '6': '.RacketReel.SetSummary', '10': 'setOne'},
    {'1': 'set_two', '3': 8, '4': 1, '5': 11, '6': '.RacketReel.SetSummary', '9': 0, '10': 'setTwo', '17': true},
    {'1': 'set_three', '3': 9, '4': 1, '5': 11, '6': '.RacketReel.SetSummary', '9': 1, '10': 'setThree', '17': true},
    {'1': 'set_four', '3': 10, '4': 1, '5': 11, '6': '.RacketReel.SetSummary', '9': 2, '10': 'setFour', '17': true},
    {'1': 'set_five', '3': 11, '4': 1, '5': 11, '6': '.RacketReel.SetSummary', '9': 3, '10': 'setFive', '17': true},
  ],
  '8': [
    {'1': '_set_two'},
    {'1': '_set_three'},
    {'1': '_set_four'},
    {'1': '_set_five'},
  ],
};

/// Descriptor for `Summary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List summaryDescriptor = $convert.base64Decode(
    'CgdTdW1tYXJ5EhkKCG1hdGNoX2lkGAEgASgFUgdtYXRjaElkEkAKDnN0YXJ0ZWRfYXRfdXRjGA'
    'IgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIMc3RhcnRlZEF0VXRjEkQKEGNvbXBs'
    'ZXRlZF9hdF91dGMYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg5jb21wbGV0ZW'
    'RBdFV0YxI1CghkdXJhdGlvbhgEIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVy'
    'YXRpb24SKgoGZm9ybWF0GAUgASgOMhIuUmFja2V0UmVlbC5Gb3JtYXRSBmZvcm1hdBIvCgdzZX'
    'Rfb25lGAcgASgLMhYuUmFja2V0UmVlbC5TZXRTdW1tYXJ5UgZzZXRPbmUSNAoHc2V0X3R3bxgI'
    'IAEoCzIWLlJhY2tldFJlZWwuU2V0U3VtbWFyeUgAUgZzZXRUd2+IAQESOAoJc2V0X3RocmVlGA'
    'kgASgLMhYuUmFja2V0UmVlbC5TZXRTdW1tYXJ5SAFSCHNldFRocmVliAEBEjYKCHNldF9mb3Vy'
    'GAogASgLMhYuUmFja2V0UmVlbC5TZXRTdW1tYXJ5SAJSB3NldEZvdXKIAQESNgoIc2V0X2Zpdm'
    'UYCyABKAsyFi5SYWNrZXRSZWVsLlNldFN1bW1hcnlIA1IHc2V0Rml2ZYgBAUIKCghfc2V0X3R3'
    'b0IMCgpfc2V0X3RocmVlQgsKCV9zZXRfZm91ckILCglfc2V0X2ZpdmU=');

@$core.Deprecated('Use setSummaryDescriptor instead')
const SetSummary$json = {
  '1': 'SetSummary',
  '2': [
    {'1': 'team_one_games', '3': 1, '4': 1, '5': 5, '10': 'teamOneGames'},
    {'1': 'team_two_games', '3': 2, '4': 1, '5': 5, '10': 'teamTwoGames'},
    {'1': 'tiebreak', '3': 3, '4': 1, '5': 8, '10': 'tiebreak'},
    {'1': 'team_one_tiebreak_points', '3': 4, '4': 1, '5': 5, '10': 'teamOneTiebreakPoints'},
    {'1': 'team_two_tiebreak_points', '3': 5, '4': 1, '5': 5, '10': 'teamTwoTiebreakPoints'},
  ],
};

/// Descriptor for `SetSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setSummaryDescriptor = $convert.base64Decode(
    'CgpTZXRTdW1tYXJ5EiQKDnRlYW1fb25lX2dhbWVzGAEgASgFUgx0ZWFtT25lR2FtZXMSJAoOdG'
    'VhbV90d29fZ2FtZXMYAiABKAVSDHRlYW1Ud29HYW1lcxIaCgh0aWVicmVhaxgDIAEoCFIIdGll'
    'YnJlYWsSNwoYdGVhbV9vbmVfdGllYnJlYWtfcG9pbnRzGAQgASgFUhV0ZWFtT25lVGllYnJlYW'
    'tQb2ludHMSNwoYdGVhbV90d29fdGllYnJlYWtfcG9pbnRzGAUgASgFUhV0ZWFtVHdvVGllYnJl'
    'YWtQb2ludHM=');

@$core.Deprecated('Use getSummariesRequestDescriptor instead')
const GetSummariesRequest$json = {
  '1': 'GetSummariesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_number', '3': 2, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
};

/// Descriptor for `GetSummariesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSummariesRequestDescriptor = $convert.base64Decode(
    'ChNHZXRTdW1tYXJpZXNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZVNpemUSHwoLcG'
    'FnZV9udW1iZXIYAiABKAVSCnBhZ2VOdW1iZXI=');

@$core.Deprecated('Use getSummariesReplyDescriptor instead')
const GetSummariesReply$json = {
  '1': 'GetSummariesReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'page_count', '3': 2, '4': 1, '5': 5, '10': 'pageCount'},
    {'1': 'summaries', '3': 3, '4': 3, '5': 11, '6': '.RacketReel.Summary', '10': 'summaries'},
  ],
};

/// Descriptor for `GetSummariesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSummariesReplyDescriptor = $convert.base64Decode(
    'ChFHZXRTdW1tYXJpZXNSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh0KCnBhZ2VfY2'
    '91bnQYAiABKAVSCXBhZ2VDb3VudBIxCglzdW1tYXJpZXMYAyADKAsyEy5SYWNrZXRSZWVsLlN1'
    'bW1hcnlSCXN1bW1hcmllcw==');

@$core.Deprecated('Use getStateRequestDescriptor instead')
const GetStateRequest$json = {
  '1': 'GetStateRequest',
  '2': [
    {'1': 'match_id', '3': 1, '4': 1, '5': 5, '10': 'matchId'},
    {'1': 'state_version', '3': 2, '4': 1, '5': 5, '10': 'stateVersion'},
  ],
};

/// Descriptor for `GetStateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStateRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRTdGF0ZVJlcXVlc3QSGQoIbWF0Y2hfaWQYASABKAVSB21hdGNoSWQSIwoNc3RhdGVfdm'
    'Vyc2lvbhgCIAEoBVIMc3RhdGVWZXJzaW9u');

@$core.Deprecated('Use getStateReplyDescriptor instead')
const GetStateReply$json = {
  '1': 'GetStateReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.State', '9': 0, '10': 'state', '17': true},
  ],
  '8': [
    {'1': '_state'},
  ],
};

/// Descriptor for `GetStateReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStateReplyDescriptor = $convert.base64Decode(
    'Cg1HZXRTdGF0ZVJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSLAoFc3RhdGUYAiABKA'
    'syES5SYWNrZXRSZWVsLlN0YXRlSABSBXN0YXRliAEBQggKBl9zdGF0ZQ==');

@$core.Deprecated('Use stateDescriptor instead')
const State$json = {
  '1': 'State',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {'1': 'created_at_utc', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAtUtc'},
    {'1': 'serving', '3': 3, '4': 1, '5': 14, '6': '.RacketReel.Team', '10': 'serving'},
    {'1': 'highlighted', '3': 4, '4': 1, '5': 8, '10': 'highlighted'},
    {'1': 'team_one_name', '3': 5, '4': 1, '5': 9, '10': 'teamOneName'},
    {'1': 'team_two_name', '3': 6, '4': 1, '5': 9, '10': 'teamTwoName'},
    {'1': 'team_one_points', '3': 7, '4': 1, '5': 9, '10': 'teamOnePoints'},
    {'1': 'team_two_points', '3': 8, '4': 1, '5': 9, '10': 'teamTwoPoints'},
    {'1': 'team_one_games', '3': 9, '4': 1, '5': 9, '10': 'teamOneGames'},
    {'1': 'team_two_games', '3': 10, '4': 1, '5': 9, '10': 'teamTwoGames'},
    {'1': 'team_one_sets', '3': 11, '4': 1, '5': 9, '10': 'teamOneSets'},
    {'1': 'team_two_sets', '3': 12, '4': 1, '5': 9, '10': 'teamTwoSets'},
  ],
};

/// Descriptor for `State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateDescriptor = $convert.base64Decode(
    'CgVTdGF0ZRIYCgd2ZXJzaW9uGAEgASgFUgd2ZXJzaW9uEkAKDmNyZWF0ZWRfYXRfdXRjGAIgAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIMY3JlYXRlZEF0VXRjEioKB3NlcnZpbmcY'
    'AyABKA4yEC5SYWNrZXRSZWVsLlRlYW1SB3NlcnZpbmcSIAoLaGlnaGxpZ2h0ZWQYBCABKAhSC2'
    'hpZ2hsaWdodGVkEiIKDXRlYW1fb25lX25hbWUYBSABKAlSC3RlYW1PbmVOYW1lEiIKDXRlYW1f'
    'dHdvX25hbWUYBiABKAlSC3RlYW1Ud29OYW1lEiYKD3RlYW1fb25lX3BvaW50cxgHIAEoCVINdG'
    'VhbU9uZVBvaW50cxImCg90ZWFtX3R3b19wb2ludHMYCCABKAlSDXRlYW1Ud29Qb2ludHMSJAoO'
    'dGVhbV9vbmVfZ2FtZXMYCSABKAlSDHRlYW1PbmVHYW1lcxIkCg50ZWFtX3R3b19nYW1lcxgKIA'
    'EoCVIMdGVhbVR3b0dhbWVzEiIKDXRlYW1fb25lX3NldHMYCyABKAlSC3RlYW1PbmVTZXRzEiIK'
    'DXRlYW1fdHdvX3NldHMYDCABKAlSC3RlYW1Ud29TZXRz');

@$core.Deprecated('Use getStateHistoryRequestDescriptor instead')
const GetStateHistoryRequest$json = {
  '1': 'GetStateHistoryRequest',
  '2': [
    {'1': 'match_id', '3': 1, '4': 1, '5': 5, '10': 'matchId'},
  ],
};

/// Descriptor for `GetStateHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStateHistoryRequestDescriptor = $convert.base64Decode(
    'ChZHZXRTdGF0ZUhpc3RvcnlSZXF1ZXN0EhkKCG1hdGNoX2lkGAEgASgFUgdtYXRjaElk');

@$core.Deprecated('Use getStateHistoryReplyDescriptor instead')
const GetStateHistoryReply$json = {
  '1': 'GetStateHistoryReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'states', '3': 2, '4': 3, '5': 11, '6': '.RacketReel.State', '10': 'states'},
  ],
};

/// Descriptor for `GetStateHistoryReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStateHistoryReplyDescriptor = $convert.base64Decode(
    'ChRHZXRTdGF0ZUhpc3RvcnlSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEikKBnN0YX'
    'RlcxgCIAMoCzIRLlJhY2tldFJlZWwuU3RhdGVSBnN0YXRlcw==');

@$core.Deprecated('Use getStateAtVersionRequestDescriptor instead')
const GetStateAtVersionRequest$json = {
  '1': 'GetStateAtVersionRequest',
  '2': [
    {'1': 'match_id', '3': 1, '4': 1, '5': 5, '10': 'matchId'},
    {'1': 'version', '3': 2, '4': 1, '5': 5, '10': 'version'},
  ],
};

/// Descriptor for `GetStateAtVersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStateAtVersionRequestDescriptor = $convert.base64Decode(
    'ChhHZXRTdGF0ZUF0VmVyc2lvblJlcXVlc3QSGQoIbWF0Y2hfaWQYASABKAVSB21hdGNoSWQSGA'
    'oHdmVyc2lvbhgCIAEoBVIHdmVyc2lvbg==');

