// ignore_for_file: lines_longer_than_80_chars
import 'dart:io';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart';
import 'package:test/test.dart';

void main() {
  test('decode a blurhash and check equality', () {
    const blurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

    final image = BlurHash.decode(blurHash).toImage(35, 20);
    final data = image.getBytes(format: Format.rgba);

    var areEqual = true;
    for (var i = 0; i < data.length; ++i) {
      if (data[i] != _decoded[i]) areEqual = false;
    }

    expect(areEqual, true);
  });

  final hashes = [
    'LNAdApj[00aymkj[TKay9}ay-Sj[',
    'LFE.@D9F01_2%L%MIVD*9Goe-;WB',
    'LlMF%n00%#MwS|WCWEM{R*bbWBbH',
    'LjIY5?00?bIUofWBWBM{WBofWBj[',
  ];

  for (var i = 0; i < hashes.length; ++i) {
    test('encode test image "$i" and check equality with blurhash', () {
      final fileData = File('test/images/test$i.png').readAsBytesSync();
      final image = decodeImage(fileData.toList());
      final blurHash = BlurHash.encode(image, numCompX: 4, numCompY: 3);

      expect(blurHash.hash, hashes[i]);
    });
  }
}

const _decoded = [
  145, 173, 177, 255, 146, 173, 177, 255, 147, 173, 177, 255, 148, 174, 177, 255,
  151, 174, 177, 255, 153, 175, 177, 255, 156, 176, 177, 255, 159, 176, 177, 255,
  162, 177, 177, 255, 166, 178, 177, 255, 169, 179, 176, 255, 172, 180, 176, 255,
  174, 181, 175, 255, 177, 182, 174, 255, 179, 182, 174, 255, 180, 183, 173, 255,
  181, 183, 172, 255, 182, 183, 172, 255, 182, 183, 171, 255, 181, 183, 171, 255,
  180, 183, 171, 255, 178, 182, 171, 255, 176, 181, 171, 255, 174, 180, 172, 255,
  171, 180, 172, 255, 168, 178, 173, 255, 164, 177, 174, 255, 161, 176, 175, 255,
  157, 175, 176, 255, 153, 174, 177, 255, 150, 173, 178, 255, 147, 172, 179, 255,
  145, 172, 180, 255, 143, 171, 181, 255, 142, 171, 181, 255, 145, 172, 177, 255,
  145, 172, 177, 255, 146, 173, 177, 255, 148, 173, 177, 255, 150, 174, 177, 255,
  153, 174, 177, 255, 155, 175, 177, 255, 159, 176, 177, 255, 162, 177, 176, 255,
  165, 178, 176, 255, 168, 178, 175, 255, 171, 179, 175, 255, 174, 180, 174, 255,
  176, 181, 174, 255, 178, 181, 173, 255, 180, 182, 172, 255, 181, 182, 171, 255,
  181, 182, 171, 255, 181, 182, 170, 255, 181, 182, 170, 255, 179, 182, 170, 255,
  178, 181, 170, 255, 176, 180, 170, 255, 173, 180, 171, 255, 170, 179, 171, 255,
  167, 178, 172, 255, 164, 177, 173, 255, 160, 176, 175, 255, 157, 175, 176, 255,
  153, 174, 177, 255, 150, 173, 178, 255, 147, 172, 179, 255, 144, 171, 180, 255,
  143, 171, 181, 255, 141, 170, 181, 255, 143, 171, 176, 255, 144, 171, 176, 255,
  145, 171, 176, 255, 146, 171, 176, 255, 148, 172, 176, 255, 151, 172, 176, 255,
  154, 173, 176, 255, 157, 174, 175, 255, 160, 174, 175, 255, 164, 175, 174, 255,
  167, 176, 173, 255, 170, 177, 173, 255, 172, 177, 172, 255, 175, 178, 171, 255,
  176, 178, 170, 255, 178, 179, 169, 255, 179, 179, 169, 255, 179, 179, 168, 255,
  179, 179, 167, 255, 179, 179, 167, 255, 178, 179, 167, 255, 176, 178, 167, 255,
  174, 178, 168, 255, 171, 177, 168, 255, 169, 176, 169, 255, 165, 175, 171, 255,
  162, 175, 172, 255, 159, 174, 173, 255, 155, 173, 175, 255, 152, 172, 176, 255,
  148, 171, 177, 255, 146, 171, 178, 255, 143, 170, 179, 255, 142, 170, 180, 255,
  140, 169, 180, 255, 141, 169, 176, 255, 141, 169, 175, 255, 142, 169, 175, 255,
  144, 169, 175, 255, 146, 169, 175, 255, 148, 170, 174, 255, 151, 170, 174, 255,
  155, 170, 173, 255, 158, 171, 172, 255, 161, 171, 171, 255, 164, 172, 170, 255,
  167, 172, 169, 255, 170, 172, 168, 255, 172, 173, 167, 255, 174, 173, 166, 255,
  175, 174, 165, 255, 176, 174, 164, 255, 177, 174, 163, 255, 176, 174, 163, 255,
  176, 174, 163, 255, 175, 174, 163, 255, 173, 174, 163, 255, 171, 173, 164, 255,
  169, 173, 165, 255, 166, 172, 166, 255, 163, 172, 168, 255, 160, 171, 169, 255,
  156, 171, 171, 255, 153, 170, 173, 255, 149, 169, 174, 255, 146, 169, 176, 255,
  144, 168, 177, 255, 141, 168, 178, 255, 140, 168, 179, 255, 139, 167, 180, 255,
  137, 166, 174, 255, 138, 166, 174, 255, 139, 166, 174, 255, 140, 166, 173, 255,
  143, 166, 173, 255, 145, 166, 172, 255, 148, 166, 171, 255, 151, 166, 170, 255,
  155, 166, 169, 255, 158, 166, 167, 255, 161, 166, 166, 255, 164, 166, 164, 255,
  166, 166, 163, 255, 168, 166, 161, 255, 170, 167, 160, 255, 172, 167, 159, 255,
  172, 167, 158, 255, 173, 167, 157, 255, 173, 167, 156, 255, 172, 167, 156, 255,
  171, 168, 157, 255, 169, 168, 157, 255, 167, 168, 159, 255, 165, 167, 160, 255,
  162, 167, 162, 255, 159, 167, 164, 255, 156, 167, 166, 255, 153, 167, 168, 255,
  150, 166, 170, 255, 147, 166, 172, 255, 144, 166, 174, 255, 141, 165, 176, 255,
  139, 165, 177, 255, 138, 165, 178, 255, 137, 165, 179, 255, 134, 162, 173, 255,
  134, 162, 172, 255, 135, 162, 172, 255, 137, 162, 171, 255, 139, 162, 170, 255,
  141, 161, 169, 255, 144, 161, 168, 255, 148, 160, 166, 255, 151, 160, 164, 255,
  154, 160, 162, 255, 157, 159, 160, 255, 160, 159, 158, 255, 162, 159, 156, 255,
  164, 159, 154, 255, 166, 159, 153, 255, 167, 159, 151, 255, 168, 159, 150, 255,
  169, 159, 149, 255, 168, 159, 149, 255, 168, 160, 149, 255, 167, 160, 150, 255,
  165, 160, 151, 255, 163, 161, 152, 255, 161, 161, 154, 255, 158, 161, 156, 255,
  155, 161, 159, 255, 153, 162, 162, 255, 149, 162, 164, 255, 146, 162, 167, 255,
  144, 162, 169, 255, 141, 162, 172, 255, 139, 162, 174, 255, 137, 162, 175, 255,
  135, 162, 176, 255, 134, 162, 177, 255, 130, 159, 171, 255, 130, 159, 171, 255,
  131, 158, 170, 255, 133, 158, 169, 255, 135, 157, 168, 255, 138, 156, 166, 255,
  140, 155, 164, 255, 144, 155, 162, 255, 147, 154, 160, 255, 150, 153, 157, 255,
  153, 152, 155, 255, 156, 151, 152, 255, 158, 150, 149, 255, 160, 150, 147, 255,
  162, 150, 145, 255, 163, 150, 143, 255, 164, 150, 141, 255, 164, 150, 140, 255,
  164, 151, 140, 255, 163, 151, 141, 255, 162, 152, 141, 255, 161, 152, 143, 255,
  159, 153, 145, 255, 157, 154, 148, 255, 154, 155, 151, 255, 151, 155, 154, 255,
  149, 156, 157, 255, 146, 157, 160, 255, 143, 157, 163, 255, 140, 157, 166, 255,
  138, 158, 169, 255, 136, 158, 171, 255, 134, 158, 173, 255, 133, 158, 175, 255,
  132, 159, 175, 255, 126, 155, 169, 255, 126, 155, 168, 255, 127, 154, 168, 255,
  129, 153, 167, 255, 131, 153, 165, 255, 134, 151, 163, 255, 137, 150, 161, 255,
  140, 149, 158, 255, 143, 147, 155, 255, 146, 146, 152, 255, 149, 144, 149, 255,
  152, 143, 145, 255, 154, 142, 142, 255, 156, 141, 139, 255, 158, 141, 136, 255,
  159, 140, 134, 255, 160, 141, 132, 255, 160, 141, 131, 255, 160, 141, 131, 255,
  159, 142, 132, 255, 158, 143, 133, 255, 157, 144, 135, 255, 155, 145, 138, 255,
  153, 147, 141, 255, 150, 148, 144, 255, 148, 149, 148, 255, 145, 150, 152, 255,
  142, 151, 156, 255, 140, 152, 160, 255, 137, 153, 163, 255, 135, 154, 166, 255,
  133, 154, 169, 255, 131, 155, 171, 255, 130, 155, 172, 255, 129, 155, 173, 255,
  123, 151, 166, 255, 123, 151, 166, 255, 124, 150, 165, 255, 126, 149, 164, 255,
  128, 148, 162, 255, 131, 147, 160, 255, 133, 145, 157, 255, 137, 143, 154, 255,
  140, 141, 150, 255, 143, 139, 146, 255, 146, 137, 143, 255, 148, 135, 139, 255,
  151, 134, 135, 255, 153, 133, 131, 255, 154, 132, 128, 255, 156, 132, 125, 255,
  156, 132, 123, 255, 157, 132, 122, 255, 156, 133, 122, 255, 156, 134, 123, 255,
  155, 135, 125, 255, 153, 137, 127, 255, 151, 138, 130, 255, 149, 140, 134, 255,
  147, 142, 138, 255, 145, 143, 143, 255, 142, 145, 147, 255, 140, 146, 152, 255,
  137, 147, 156, 255, 135, 149, 160, 255, 133, 150, 163, 255, 131, 150, 166, 255,
  129, 151, 168, 255, 128, 151, 170, 255, 127, 152, 171, 255, 120, 148, 164, 255,
  121, 148, 164, 255, 122, 147, 163, 255, 123, 146, 161, 255, 126, 144, 159, 255,
  128, 143, 157, 255, 131, 140, 153, 255, 134, 138, 150, 255, 137, 136, 146, 255,
  140, 133, 142, 255, 143, 131, 137, 255, 146, 129, 133, 255, 148, 127, 128, 255,
  150, 126, 124, 255, 152, 125, 121, 255, 153, 125, 118, 255, 154, 125, 115, 255,
  154, 125, 114, 255, 154, 126, 114, 255, 153, 127, 115, 255, 152, 129, 117, 255,
  151, 130, 120, 255, 149, 132, 124, 255, 147, 134, 128, 255, 145, 136, 133, 255,
  143, 138, 138, 255, 140, 140, 143, 255, 138, 142, 148, 255, 135, 143, 152, 255,
  133, 145, 157, 255, 131, 146, 160, 255, 129, 147, 163, 255, 128, 148, 166, 255,
  126, 148, 168, 255, 126, 148, 169, 255, 119, 145, 162, 255, 120, 145, 161, 255,
  121, 144, 160, 255, 122, 143, 159, 255, 124, 141, 156, 255, 127, 139, 154, 255,
  130, 137, 150, 255, 133, 135, 146, 255, 136, 132, 142, 255, 139, 129, 137, 255,
  142, 127, 133, 255, 145, 125, 128, 255, 147, 123, 123, 255, 149, 121, 119, 255,
  151, 120, 115, 255, 152, 120, 111, 255, 153, 120, 109, 255, 153, 120, 108, 255,
  153, 121, 108, 255, 152, 123, 109, 255, 151, 124, 111, 255, 150, 126, 115, 255,
  148, 128, 119, 255, 147, 131, 124, 255, 144, 133, 129, 255, 142, 135, 134, 255,
  140, 137, 139, 255, 137, 139, 144, 255, 135, 140, 149, 255, 132, 142, 153, 255,
  130, 143, 157, 255, 128, 144, 161, 255, 127, 145, 163, 255, 126, 145, 165, 255,
  125, 146, 166, 255, 120, 143, 159, 255, 120, 143, 159, 255, 121, 142, 158, 255,
  122, 141, 156, 255, 125, 139, 154, 255, 127, 137, 151, 255, 130, 135, 147, 255,
  133, 133, 143, 255, 136, 130, 139, 255, 139, 127, 134, 255, 142, 125, 129, 255,
  144, 123, 124, 255, 147, 121, 119, 255, 149, 119, 115, 255, 151, 118, 111, 255,
  152, 118, 107, 255, 153, 118, 105, 255, 153, 118, 104, 255, 153, 119, 104, 255,
  153, 121, 105, 255, 152, 122, 107, 255, 151, 124, 111, 255, 149, 127, 115, 255,
  147, 129, 120, 255, 145, 131, 125, 255, 143, 133, 131, 255, 140, 135, 136, 255,
  138, 137, 141, 255, 135, 138, 146, 255, 133, 140, 151, 255, 131, 141, 155, 255,
  129, 142, 158, 255, 127, 142, 160, 255, 126, 143, 162, 255, 125, 143, 163, 255,
  121, 142, 157, 255, 121, 142, 157, 255, 122, 141, 156, 255, 124, 140, 154, 255,
  126, 138, 152, 255, 128, 136, 149, 255, 131, 134, 145, 255, 134, 132, 141, 255,
  137, 130, 137, 255, 140, 127, 132, 255, 143, 125, 127, 255, 145, 123, 122, 255,
  148, 121, 118, 255, 150, 120, 113, 255, 152, 119, 109, 255, 153, 119, 106, 255,
  154, 119, 103, 255, 155, 119, 102, 255, 155, 120, 102, 255, 155, 122, 104, 255,
  154, 123, 106, 255, 153, 125, 109, 255, 151, 127, 114, 255, 150, 129, 118, 255,
  147, 131, 124, 255, 145, 133, 129, 255, 142, 134, 134, 255, 140, 136, 139, 255,
  137, 137, 144, 255, 134, 138, 148, 255, 132, 139, 152, 255, 130, 140, 155, 255,
  128, 141, 158, 255, 126, 141, 160, 255, 126, 142, 161, 255, 124, 141, 155, 255,
  124, 141, 155, 255, 125, 141, 154, 255, 126, 140, 152, 255, 128, 138, 150, 255,
  131, 137, 147, 255, 133, 135, 144, 255, 136, 133, 140, 255, 139, 131, 136, 255,
  142, 129, 131, 255, 145, 127, 127, 255, 148, 126, 122, 255, 150, 124, 118, 255,
  152, 123, 113, 255, 154, 123, 110, 255, 156, 122, 107, 255, 157, 123, 104, 255,
  158, 123, 103, 255, 158, 124, 103, 255, 158, 125, 105, 255, 157, 127, 107, 255,
  156, 128, 110, 255, 155, 130, 114, 255, 153, 131, 118, 255, 151, 133, 123, 255,
  148, 134, 128, 255, 145, 135, 133, 255, 142, 137, 138, 255, 139, 138, 142, 255,
  137, 138, 146, 255, 134, 139, 150, 255, 131, 140, 153, 255, 129, 140, 155, 255,
  128, 140, 157, 255, 127, 141, 158, 255, 127, 142, 153, 255, 127, 142, 153, 255,
  128, 141, 152, 255, 129, 140, 150, 255, 131, 139, 148, 255, 133, 138, 146, 255,
  136, 137, 143, 255, 139, 135, 139, 255, 142, 134, 135, 255, 145, 132, 131, 255,
  148, 131, 127, 255, 150, 130, 123, 255, 153, 129, 119, 255, 155, 128, 115, 255,
  158, 128, 112, 255, 159, 128, 109, 255, 161, 128, 107, 255, 162, 129, 107, 255,
  162, 129, 107, 255, 162, 130, 108, 255, 161, 131, 109, 255, 160, 133, 112, 255,
  159, 134, 116, 255, 157, 135, 120, 255, 155, 136, 124, 255, 152, 137, 128, 255,
  149, 137, 133, 255, 146, 138, 137, 255, 143, 139, 141, 255, 139, 139, 145, 255,
  136, 139, 148, 255, 134, 140, 151, 255, 132, 140, 153, 255, 130, 140, 154, 255,
  129, 140, 155, 255, 131, 142, 151, 255, 131, 142, 151, 255, 132, 142, 150, 255,
  133, 141, 149, 255, 135, 141, 147, 255, 137, 140, 145, 255, 139, 139, 142, 255,
  142, 138, 139, 255, 145, 137, 136, 255, 148, 136, 132, 255, 151, 135, 129, 255,
  154, 135, 125, 255, 156, 134, 122, 255, 159, 134, 118, 255, 161, 134, 116, 255,
  163, 134, 113, 255, 164, 134, 112, 255, 166, 135, 111, 255, 166, 136, 111, 255,
  166, 136, 112, 255, 166, 137, 113, 255, 165, 138, 116, 255, 163, 139, 118, 255,
  161, 139, 122, 255, 159, 140, 125, 255, 156, 140, 129, 255, 153, 140, 133, 255,
  150, 140, 137, 255, 146, 140, 140, 255, 143, 140, 144, 255, 139, 140, 146, 255,
  136, 140, 149, 255, 134, 140, 151, 255, 132, 140, 152, 255, 131, 140, 153, 255,
  134, 143, 150, 255, 134, 143, 149, 255, 135, 143, 149, 255, 136, 143, 148, 255,
  138, 142, 146, 255, 140, 142, 144, 255, 142, 141, 142, 255, 145, 141, 139, 255,
  148, 140, 136, 255, 151, 140, 133, 255, 154, 140, 130, 255, 157, 140, 127, 255,
  160, 140, 124, 255, 162, 140, 122, 255, 165, 140, 119, 255, 167, 140, 118, 255,
  168, 141, 116, 255, 169, 141, 116, 255, 170, 142, 115, 255, 170, 142, 116, 255,
  170, 143, 117, 255, 169, 143, 119, 255, 167, 143, 122, 255, 165, 144, 124, 255,
  163, 144, 127, 255, 160, 143, 131, 255, 157, 143, 134, 255, 153, 143, 137, 255,
  149, 142, 140, 255, 146, 142, 143, 255, 142, 141, 145, 255, 139, 141, 147, 255,
  136, 141, 149, 255, 134, 140, 150, 255, 133, 140, 151, 255, 137, 144, 149, 255,
  137, 144, 148, 255, 138, 144, 148, 255, 139, 144, 147, 255, 141, 144, 145, 255,
  143, 144, 144, 255, 145, 144, 142, 255, 148, 144, 140, 255, 151, 144, 137, 255,
  154, 144, 135, 255, 157, 144, 132, 255, 160, 144, 130, 255, 162, 144, 127, 255,
  165, 145, 125, 255, 168, 145, 123, 255, 170, 146, 122, 255, 172, 146, 120, 255,
  173, 147, 120, 255, 174, 147, 120, 255, 174, 148, 120, 255, 174, 148, 121, 255,
  173, 148, 123, 255, 171, 148, 125, 255, 169, 148, 127, 255, 166, 147, 129, 255,
  163, 147, 132, 255, 160, 146, 135, 255, 156, 145, 137, 255, 152, 144, 140, 255,
  148, 143, 142, 255, 145, 143, 144, 255, 141, 142, 146, 255, 138, 141, 147, 255,
  136, 141, 149, 255, 135, 140, 149, 255, 140, 145, 148, 255, 140, 145, 147, 255,
  140, 145, 147, 255, 142, 145, 146, 255, 143, 145, 145, 255, 145, 146, 144, 255,
  147, 146, 142, 255, 150, 146, 140, 255, 153, 146, 138, 255, 156, 147, 136, 255,
  159, 147, 134, 255, 162, 148, 132, 255, 165, 148, 130, 255, 168, 149, 128, 255,
  170, 150, 126, 255, 172, 150, 125, 255, 174, 151, 124, 255, 176, 151, 123, 255,
  176, 152, 123, 255, 177, 152, 124, 255, 176, 152, 124, 255, 176, 152, 126, 255,
  174, 151, 127, 255, 172, 151, 129, 255, 169, 150, 131, 255, 166, 149, 133, 255,
  163, 148, 135, 255, 159, 147, 138, 255, 155, 146, 140, 255, 150, 145, 142, 255,
  147, 144, 144, 255, 143, 143, 145, 255, 140, 142, 146, 255, 137, 141, 147, 255,
  136, 141, 148, 255, 141, 146, 147, 255, 141, 146, 147, 255, 142, 146, 147, 255,
  143, 146, 146, 255, 145, 146, 145, 255, 147, 147, 144, 255, 149, 147, 142, 255,
  151, 147, 140, 255, 154, 148, 139, 255, 157, 149, 137, 255, 160, 149, 135, 255,
  163, 150, 133, 255, 166, 151, 131, 255, 169, 151, 129, 255, 172, 152, 128, 255,
  174, 153, 127, 255, 176, 153, 126, 255, 177, 154, 125, 255, 178, 154, 125, 255,
  178, 154, 126, 255, 178, 154, 126, 255, 177, 154, 127, 255, 176, 153, 129, 255,
  174, 153, 130, 255, 171, 152, 132, 255, 168, 151, 134, 255, 164, 150, 136, 255,
  160, 148, 138, 255, 156, 147, 140, 255, 152, 146, 142, 255, 148, 144, 143, 255,
  144, 143, 145, 255, 141, 142, 146, 255, 138, 141, 147, 255, 137, 141, 147, 255
];
