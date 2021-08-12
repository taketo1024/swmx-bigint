//
//  BigRational.swift
//  
//
//  Created by Taketo Sano on 2021/08/12.
//

import SwmCore
import BigInt

public typealias BigRational = Rational<BigInt>

extension Rational where Base == BigInt {
    public init(_ x: RationalNumber) {
        self.init(BigInt(x.numerator), BigInt(x.denominator))
    }
}
