import BigInt
import SwmCore

extension BigInt: EuclideanRing {
    @inlinable
    public init(from n: 𝐙) {
        self.init(n)
    }

    @inlinable
    public static var zero: Self {
        0
    }

    @inlinable
    public static var identity: Self {
        1
    }

    @inlinable
    public var inverse: Self? {
        (self.abs == 1) ? self : nil
    }

    @inlinable
    public var normalizingUnit: Self {
        (self >= 0) ? 1 : -1
    }

    @inlinable
    public var abs: Self {
        (self >= 0) ? self : -self
    }

    @inlinable
    public var isEven: Bool {
        (self % 2 == 0)
    }

    @inlinable
    public var isOdd: Bool {
        !isEven
    }

    public func pow(_ n: 𝐙) -> Self {
        switch  self {
        case 1:
            return 1
        case -1:
            return n.isEven ? 1 : -1
        default:
            assert(n >= 0)
            return (0 ..< n).reduce(1){ (res, _) in self * res }
        }
    }

    @inlinable
    public var euclideanDegree: Self {
        self.abs
    }
    
    @inlinable
    public static func /%(a: Self, b: Self) -> (quotient: Self, remainder: Self) {
        let q = a / b
        return (q, a - q * b)
    }
    
    @inlinable
    public static func ./(a: Self, b: Self) -> BigRational {
        .init(a, b)
    }
    
    public static var symbol: String {
        "BigInt"
    }
}
