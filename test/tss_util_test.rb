require 'test_helper'

describe TSS::Util do

  describe 'EXP constant' do
    it 'must match the documented table' do
      # copied from the spec docs directly
      DOC_EXP = [0x01, 0x03, 0x05, 0x0f, 0x11, 0x33, 0x55, 0xff,
              0x1a, 0x2e, 0x72, 0x96, 0xa1, 0xf8, 0x13, 0x35,
              0x5f, 0xe1, 0x38, 0x48, 0xd8, 0x73, 0x95, 0xa4,
              0xf7, 0x02, 0x06, 0x0a, 0x1e, 0x22, 0x66, 0xaa,
              0xe5, 0x34, 0x5c, 0xe4, 0x37, 0x59, 0xeb, 0x26,
              0x6a, 0xbe, 0xd9, 0x70, 0x90, 0xab, 0xe6, 0x31,
              0x53, 0xf5, 0x04, 0x0c, 0x14, 0x3c, 0x44, 0xcc,
              0x4f, 0xd1, 0x68, 0xb8, 0xd3, 0x6e, 0xb2, 0xcd,
              0x4c, 0xd4, 0x67, 0xa9, 0xe0, 0x3b, 0x4d, 0xd7,
              0x62, 0xa6, 0xf1, 0x08, 0x18, 0x28, 0x78, 0x88,
              0x83, 0x9e, 0xb9, 0xd0, 0x6b, 0xbd, 0xdc, 0x7f,
              0x81, 0x98, 0xb3, 0xce, 0x49, 0xdb, 0x76, 0x9a,
              0xb5, 0xc4, 0x57, 0xf9, 0x10, 0x30, 0x50, 0xf0,
              0x0b, 0x1d, 0x27, 0x69, 0xbb, 0xd6, 0x61, 0xa3,
              0xfe, 0x19, 0x2b, 0x7d, 0x87, 0x92, 0xad, 0xec,
              0x2f, 0x71, 0x93, 0xae, 0xe9, 0x20, 0x60, 0xa0,
              0xfb, 0x16, 0x3a, 0x4e, 0xd2, 0x6d, 0xb7, 0xc2,
              0x5d, 0xe7, 0x32, 0x56, 0xfa, 0x15, 0x3f, 0x41,
              0xc3, 0x5e, 0xe2, 0x3d, 0x47, 0xc9, 0x40, 0xc0,
              0x5b, 0xed, 0x2c, 0x74, 0x9c, 0xbf, 0xda, 0x75,
              0x9f, 0xba, 0xd5, 0x64, 0xac, 0xef, 0x2a, 0x7e,
              0x82, 0x9d, 0xbc, 0xdf, 0x7a, 0x8e, 0x89, 0x80,
              0x9b, 0xb6, 0xc1, 0x58, 0xe8, 0x23, 0x65, 0xaf,
              0xea, 0x25, 0x6f, 0xb1, 0xc8, 0x43, 0xc5, 0x54,
              0xfc, 0x1f, 0x21, 0x63, 0xa5, 0xf4, 0x07, 0x09,
              0x1b, 0x2d, 0x77, 0x99, 0xb0, 0xcb, 0x46, 0xca,
              0x45, 0xcf, 0x4a, 0xde, 0x79, 0x8b, 0x86, 0x91,
              0xa8, 0xe3, 0x3e, 0x42, 0xc6, 0x51, 0xf3, 0x0e,
              0x12, 0x36, 0x5a, 0xee, 0x29, 0x7b, 0x8d, 0x8c,
              0x8f, 0x8a, 0x85, 0x94, 0xa7, 0xf2, 0x0d, 0x17,
              0x39, 0x4b, 0xdd, 0x7c, 0x84, 0x97, 0xa2, 0xfd,
              0x1c, 0x24, 0x6c, 0xb4, 0xc7, 0x52, 0xf6, 0x00].freeze

      TSS::Util::EXP.must_equal DOC_EXP
    end
  end

  describe 'LOG constant' do
    it 'must match the documented table' do
      # copied from the spec docs directly
      DOC_LOG = [0,     0,   25,    1,   50,    2,   26,  198,
              75,  199,   27,  104,   51,  238,  223,    3,
              100,   4,  224,   14,   52,  141,  129,  239,
              76,  113,    8,  200,  248,  105,   28,  193,
              125, 194,   29,  181,  249,  185,   39,  106,
              77,  228,  166,  114,  154,  201,    9,  120,
              101,  47,  138,    5,   33,   15,  225,   36,
              18,  240,  130,   69,   53,  147,  218,  142,
              150, 143,  219,  189,   54,  208,  206,  148,
              19,   92,  210,  241,   64,   70,  131,   56,
              102, 221,  253,   48,  191,    6,  139,   98,
              179,  37,  226,  152,   34,  136,  145,   16,
              126, 110,   72,  195,  163,  182,   30,   66,
              58,  107,   40,   84,  250,  133,   61,  186,
              43,  121,   10,   21,  155,  159,   94,  202,
              78,  212,  172,  229,  243,  115,  167,   87,
              175,  88,  168,   80,  244,  234,  214,  116,
              79,  174,  233,  213,  231,  230,  173,  232,
              44,  215,  117,  122,  235,   22,   11,  245,
              89,  203,   95,  176,  156,  169,   81,  160,
              127,  12,  246,  111,   23,  196,   73,  236,
              216,  67,   31,   45,  164,  118,  123,  183,
              204, 187,   62,   90,  251,   96,  177,  134,
              59,   82,  161,  108,  170,   85,   41,  157,
              151, 178,  135,  144,   97,  190,  220,  252,
              188, 149,  207,  205,   55,   63,   91,  209,
              83,   57,  132,   60,   65,  162,  109,   71,
              20,   42,  158,   93,   86,  242,  211,  171,
              68,   17,  146,  217,   35,   32,   46,  137,
              180, 124,  184,   38,  119,  153,  227,  165,
              103,  74,  237,  222,  197,   49,  254,   24,
              13,   99,  140,  128,  192,  247,  112,    7].freeze

      TSS::Util::LOG.must_equal DOC_LOG
    end
  end

  describe 'gf256_add' do
    it 'must return a correct result' do
      # In GF256 Math A - B == A + B
      TSS::Util.gf256_add(15, 6).must_equal 9
    end
  end

  describe 'gf256_sub' do
    it 'must return a correct result' do
      # In GF256 Math A - B == A + B
      TSS::Util.gf256_sub(15, 6).must_equal 9
    end
  end

  describe 'gf256_mul' do
    it 'must return 0 if X == 0' do
      TSS::Util.gf256_mul(0, 6).must_equal 0
    end

    it 'must return 0 if Y == 0' do
      TSS::Util.gf256_mul(15, 0).must_equal 0
    end

    it 'must return a correct result' do
      TSS::Util.gf256_mul(5, 10).must_equal 34
    end
  end

  describe 'gf256_div' do
    it 'must return 0 if X == 0' do
      TSS::Util.gf256_div(0, 6).must_equal 0
    end

    it 'must raise an error if Y == 0 (divide by zero)' do
      assert_raises(TSS::Error) { TSS::Util.gf256_div(15, 0) }
    end

    it 'must return a correct result' do
      TSS::Util.gf256_div(5, 10).must_equal 141
    end
  end

  describe 'utf8_to_bytes' do
    it 'must present a correct result' do
      test_str = 'I ½ ♥ 💩'
      TSS::Util.utf8_to_bytes(test_str).must_equal test_str.bytes.to_a
    end
  end

  describe 'bytes_to_utf8' do
    it 'must present a correct result' do
      test_str = 'I ½ ♥ 💩'
      TSS::Util.bytes_to_utf8(test_str.bytes.to_a).must_equal test_str
    end
  end

  describe 'bytes_to_hex' do
    it 'must present a correct result' do
      test_str = 'I ½ ♥ 💩'
      bytes = test_str.bytes.to_a
      TSS::Util.bytes_to_hex(bytes).must_equal '4920c2bd20e299a520f09f92a9'
    end
  end

  describe 'hex_to_bytes' do
    it 'must present a correct result' do
      test_str = 'I ½ ♥ 💩'
      bytes = test_str.bytes.to_a
      TSS::Util.hex_to_bytes('4920c2bd20e299a520f09f92a9').must_equal bytes
    end
  end

  describe 'hex_to_utf8' do
    it 'must present a correct result' do
      test_str = 'I ½ ♥ 💩'
      bytes = test_str.bytes.to_a
      hex = TSS::Util.bytes_to_hex(bytes)
      TSS::Util.hex_to_utf8(hex).must_equal test_str
    end
  end

  describe 'utf8_to_hex' do
    it 'must present a correct result' do
      test_str = 'I ½ ♥ 💩'
      TSS::Util.utf8_to_hex(test_str).must_equal '4920c2bd20e299a520f09f92a9'
    end
  end

  describe 'left_pad' do
    it 'must increase length of a short string the same size as the byte_multiple' do
      mult = 8
      res = TSS::Util.left_pad(mult, 'a'*1)
      res.must_equal "\u001F\u001F\u001F\u001F\u001F\u001F\u001Fa"
      res.length.must_equal 8
    end

    it 'must maintain the length of a string the same size as the byte_multiple' do
      mult = 8
      res = TSS::Util.left_pad(mult, 'a'*8)
      res.must_equal 'aaaaaaaa'
      res.length.must_equal 8
    end

    it 'must increase length of a string to the next multiple when string is larger than the byte_multiple' do
      mult = 8
      res = TSS::Util.left_pad(mult, 'a'*9)
      res.must_equal "\u001F\u001F\u001F\u001F\u001F\u001F\u001Faaaaaaaaa"
      res.length.must_equal 16
    end

    it 'must not change the string if the byte_multiple is 0 (no padding)' do
      mult = 0
      res = TSS::Util.left_pad(mult, 'a'*9)
      res.must_equal 'aaaaaaaaa'
      res.length.must_equal 9
    end

    it 'must pad with the specified padding character' do
      mult = 8
      res = TSS::Util.left_pad(mult, 'a', '0')
      res.must_equal '0000000a'
      res.length.must_equal 8
    end
  end

  describe 'int_commas' do
    it 'must add commas as expected for human reading to large Integers' do
      TSS::Util.int_commas(1234567890000000).must_equal '1,234,567,890,000,000'
    end
  end

  describe 'secure_compare' do
    it 'must return true for same strings' do
      TSS::Util.secure_compare('a', 'a').must_equal true
    end

    it 'must return false for different strings' do
      TSS::Util.secure_compare('a', 'b').must_equal false
    end
  end
end
