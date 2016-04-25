//
//  String+KaitaiStream.swift
//  KaitaiStream
//
//  Created by Mothlike on 25.04.16.
//  Copyright © 2016 Dmitry Marochko. All rights reserved.
//

import Foundation

extension String {
    public init?(kaitaiStream:KaitaiStream, encoding:NSStringEncoding) {
        guard let string = kaitaiStream.readStrEos(encoding) else {
            return nil
        }

        self = string
    }

    public init?(kaitaiStream:KaitaiStream, length:Int, encoding:NSStringEncoding) {
        guard let string = kaitaiStream.readStrByteLimit(length,encoding: encoding) else {
            return nil
        }

        self = string
    }

    public init?(kaitaiStream:KaitaiStream, encoding:NSStringEncoding, termination:UInt8, includeTermination:Bool=false,consumeTermination:Bool=true) {
        guard let string = kaitaiStream.readStrz(encoding, termination: termination, includeTermination: includeTermination, consumeTermination: consumeTermination) else {
            return nil
        }

        self = string
    }
}