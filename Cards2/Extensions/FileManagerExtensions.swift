//
//  FileManagerExtensions.swift
//  Cards2
//
//  Created by 하진호 on 2022/04/28.
//

import SwiftUI

extension FileManager {
    static var documentURL: URL? {
        Self.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
