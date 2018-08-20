//
//  String+Extension.swift
//  Searcher
//
//  Created by Everson Trindade on 13/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

extension String {
    var md5: String? {
        guard let messageData = self.data(using:.utf8) else {
            return nil
        }
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        _ = digestData.withUnsafeMutableBytes { digestBytes in
            messageData.withUnsafeBytes { messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData.map { String(format: "%02hhx", $0) }.joined()
    }
}
