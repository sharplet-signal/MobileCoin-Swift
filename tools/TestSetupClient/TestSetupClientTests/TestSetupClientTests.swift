//
//  TestSetupClientTests.swift
//  TestSetupClientTests
//
//  Created by Cary Bakker on 4/18/23.
//

import XCTest
@testable import TestSetupClient

final class TestSetupClientTests: XCTestCase {

    func testCreateAccounts() async throws {
        guard let testAccountSeed = ProcessInfo.processInfo.environment["testAccountSeed"] else {
            XCTFail("Unable to get testAccountSeed value")
            return
        }

        guard let srcAcctEntropyString = ProcessInfo.processInfo.environment["srcAcctEntropyString"] else {
            XCTFail("Unable to get source account emtropy string")
            return
        }

        let result = await TestWalletCreator().createAccounts(
            srcAcctEntropyString: srcAcctEntropyString,
            testAccountSeed: testAccountSeed)
        
        switch result {
        case .success:
            print("Test accounts created successfully")
        case let .failure(error):
            switch error {
            case .error(let message):
                XCTFail("Test account creation failed with error: \(message)")
            }
        }
    }

}