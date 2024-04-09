//
//  PacketEncoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

import Foundation

public class PacketEncoder {
    public init() {
    }

    public func encode(_ packet: any PacketProtocol) throws -> Data {
        let encoder = BinaryEncoder()
        try packet.encode(to: encoder)
        return encoder.data
    }
}
