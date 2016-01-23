//
//  BitMaskTests.swift
//  bmap
//
//  Created by Logan Wright on 12/8/15.
//  Copyright © 2015 Intrepid. All rights reserved.
//

import XCTest
@testable import SwiftWisdom

class BitMaskTests: XCTestCase {
    
    func testBitmaskContains() {
        let one: UInt8 = 0b1
        let two: UInt8 = 0b10
        let four: UInt8 = 0b100
        let twentyFour: UInt8 = 0b11000
        
        let combination = one | two | four | twentyFour
        let mask = UInt8(combination)
        
        XCTAssert(mask.ip_containsBitMask(one))
        XCTAssert(mask.ip_containsBitMask(two))
        XCTAssert(mask.ip_containsBitMask(four))
        XCTAssert(mask.ip_containsBitMask(twentyFour))
    }
    
    func testDataInitializer() {
        let data = "0x1f".ip_dataFromHexadecimalString()!
        let mask = UInt8(ip_data: data)
        let hex = data.ip_hexInt!
        XCTAssert(hex == UInt(mask))
        
        let empty = NSData()
        let emptyMask = UInt8(ip_data: empty)
        let emptyHex = empty.ip_hexInt ?? 0
        XCTAssert(UInt8(ip_safely: emptyHex) == emptyMask)
    }
}
