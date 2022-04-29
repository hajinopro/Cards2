//
//  AngleExtensions.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/29.
//

import SwiftUI

extension Angle: Codable {
    enum CodingKeys: CodingKey {
        case degrees
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(degrees, forKey: .degrees)
    }
    
    public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        degrees = try container.decode(Double.self, forKey: .degrees)
    }
}
