//
//  Sequence+asyncForEach.swift
//  iOSCore
//
//  Created by Jaewon Yun on 2023/10/06.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Foundation

extension Sequence {

    @available(iOS 13.0, macOS 10.15.0, *)
    public func asyncForEach(_ body: (Self.Element) async throws -> Void) async rethrows {
        for element in self {
            try await body(element)
        }
    }

}
