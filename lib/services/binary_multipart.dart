import 'dart:convert';

class ParsedMultipartFile {
  ParsedMultipartFile({
    required this.fieldName,
    required this.filename,
    required this.bytes,
    this.contentType,
  });

  final String fieldName;
  final String filename;
  final List<int> bytes;
  final String? contentType;
}

class ParsedMultipartForm {
  ParsedMultipartForm({
    required this.fields,
    required this.files,
  });

  final Map<String, String> fields;
  final Map<String, ParsedMultipartFile> files;
}

/// Parses multipart/form-data from raw bytes (supports binary file parts).
ParsedMultipartForm parseMultipartForm(
  List<int> bodyBytes,
  String contentTypeHeader,
) {
  final boundaryMatch =
      RegExp(r'boundary=([^;]+)').firstMatch(contentTypeHeader);
  if (boundaryMatch == null) {
    throw ArgumentError('Missing multipart boundary');
  }
  final boundary = utf8.encode('--${boundaryMatch.group(1)!.trim()}');
  final delimiter = utf8.encode('\r\n\r\n');

  final fields = <String, String>{};
  final files = <String, ParsedMultipartFile>{};

  var searchFrom = 0;
  while (true) {
    final boundaryIndex = _indexOfBytes(bodyBytes, boundary, searchFrom);
    if (boundaryIndex < 0) break;

    var partStart = boundaryIndex + boundary.length;
    if (partStart + 2 <= bodyBytes.length &&
        bodyBytes[partStart] == 13 &&
        bodyBytes[partStart + 1] == 10) {
      partStart += 2;
    }

    final nextBoundary = _indexOfBytes(bodyBytes, boundary, partStart);
    if (nextBoundary < 0) break;

    var partEnd = nextBoundary;
    if (partEnd >= 2 &&
        bodyBytes[partEnd - 2] == 13 &&
        bodyBytes[partEnd - 1] == 10) {
      partEnd -= 2;
    }

    final partBytes = bodyBytes.sublist(partStart, partEnd);
    final headerEnd = _indexOfBytes(partBytes, delimiter, 0);
    if (headerEnd < 0) {
      searchFrom = nextBoundary + boundary.length;
      continue;
    }

    final headerText = utf8.decode(partBytes.sublist(0, headerEnd));
    final body = partBytes.sublist(headerEnd + delimiter.length);

    final nameMatch = RegExp(r'name="([^"]+)"').firstMatch(headerText);
    if (nameMatch == null) {
      searchFrom = nextBoundary + boundary.length;
      continue;
    }
    final name = nameMatch.group(1)!;
    final filenameMatch =
        RegExp(r'filename="([^"]*)"').firstMatch(headerText);
    final typeMatch =
        RegExp(r'Content-Type:\s*([^\r\n]+)', caseSensitive: false)
            .firstMatch(headerText);

    if (filenameMatch != null) {
      files[name] = ParsedMultipartFile(
        fieldName: name,
        filename: filenameMatch.group(1) ?? 'file',
        bytes: body,
        contentType: typeMatch?.group(1)?.trim(),
      );
    } else {
      fields[name] = utf8.decode(body).trim();
    }

    searchFrom = nextBoundary + boundary.length;
  }

  return ParsedMultipartForm(fields: fields, files: files);
}

int _indexOfBytes(List<int> haystack, List<int> needle, int start) {
  if (needle.isEmpty || haystack.length < needle.length) return -1;
  for (var i = start; i <= haystack.length - needle.length; i++) {
    var found = true;
    for (var j = 0; j < needle.length; j++) {
      if (haystack[i + j] != needle[j]) {
        found = false;
        break;
      }
    }
    if (found) return i;
  }
  return -1;
}
