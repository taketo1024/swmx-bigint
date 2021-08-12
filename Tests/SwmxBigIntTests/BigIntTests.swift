import XCTest
import SwmCore
import BigInt
@testable import SwmxBigInt

final class SwmxBigIntTests: XCTestCase {
    typealias A = BigInt
    
    func testSum() {
        let a = A(1)
        let b = A(2)
        XCTAssertEqual(a + b, A(3))
    }
    
    func testZero() {
        let a = A(3)
        XCTAssertEqual(a + A.zero, a)
        XCTAssertEqual(A.zero + a, a)
    }

    func testNeg() {
        let a = A(3)
        XCTAssertEqual(-a, A(-3))
    }

    func testMul() {
        let a = A(3)
        let b = A(2)
        XCTAssertEqual(a * b, A(6))
    }
    
    func testId() {
        let a = A(3)
        let e = A.identity
        XCTAssertEqual(a * e, a)
        XCTAssertEqual(e * a, a)
    }
    
    func testPow() {
        let a = A(2)
        XCTAssertEqual(a.pow(0), A.identity)
        XCTAssertEqual(a.pow(1), a)
        XCTAssertEqual(a.pow(2), A(4))
        XCTAssertEqual(a.pow(3), A(8))
        
        let b = A(-1)
        XCTAssertEqual(b.pow(0), A.identity)
        XCTAssertEqual(b.pow(-1), A(-1))
        XCTAssertEqual(b.pow(-2), A(1))
        XCTAssertEqual(b.pow(-3), A(-1))
    }
    
    func testIsEven() {
        XCTAssertTrue(A(2).isEven)
        XCTAssertFalse(A(3).isEven)
    }
    
    func testAbs() {
        XCTAssertEqual(A(13).abs, 13)
        XCTAssertEqual( A(0).abs, 0)
        XCTAssertEqual(A(-4).abs, 4)
    }
    
    func testEucDiv() {
        let a = A(7)
        let b = A(3)
        let (q, r) = a /% b
        XCTAssertEqual(q, A(2))
        XCTAssertEqual(r, A(1))
    }
}
