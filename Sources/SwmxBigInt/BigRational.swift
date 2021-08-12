//
//  BigRational.swift
//  
//
//  Created by Taketo Sano on 2021/08/12.
//

import SwmCore
import SwmMatrixTools
import BigInt

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

extension BigRational: ComputationalField {
    public typealias ComputationalMatrixImpl = DefaultSparseMatrixImpl<Self> // TODO
    public typealias ComputationalSparseMatrixImpl = DefaultSparseMatrixImpl<Self>
    
    public var computationalWeight: Double {
        isZero ? 0 : Double(max(numerator.abs, denominator))
    }
}
