package com.mvsolutions.payus.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.Normalizer;

public class Decoder {
    public static String fileNameDecoder(String filename) {
        try {
            filename = normalizeNfc(URLDecoder.decode(filename, "UTF-8"));
            return filename;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    protected static String normalizeNfc(String unNormalMailBoxName) {
        if (!Normalizer.isNormalized(unNormalMailBoxName, Normalizer.Form.NFC)) {
            return Normalizer.normalize(unNormalMailBoxName, Normalizer.Form.NFC);
        }
        return unNormalMailBoxName;
    }
}
