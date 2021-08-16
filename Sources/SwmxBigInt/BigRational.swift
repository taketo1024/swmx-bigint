//
//  BigRational.swift
//  
//
//  Created by Taketo Sano on 2021/08/12.
//

import BigInt
import SwmCore

public struct BigRational: FractionField {
    public typealias Base = BigInt
    public let numerator: Base
    public let denominator: Base  // memo: (p, q) coprime, q > 0.
    
    @inlinable
    public init(reduced p: Base, _ q: Base) {
        self.numerator = p
        self.denominator = q
    }
}

extension BigRational: Comparable {}
extension BigRational: Hashable {}
extension BigRational: Codable {}
extension BigRational: ExpressibleByIntegerLiteral {}
