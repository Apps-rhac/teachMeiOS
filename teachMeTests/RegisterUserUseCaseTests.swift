//
//  RegisterUserUseCaseTest.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 5/11/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
@testable import teachMe

class RegisteruserUseCaseTests : XCTestCase {
    
    private var gateway:AuthenticationGatewayStub!
    private var usecase:RegisterUserUsecase!
    
    override func setUp() {
        gateway = AuthenticationGatewayStub()
        usecase = RegisterUserUsecase(gateway: gateway)
    }
    
    func testRegisterAStudentUserWithEmptyEmail_ReturnsANilregisteredUser() {
        usecase.register(email: "", password:"password", accountType:AccountType.Student)
        XCTAssertNil(gateway.registeredUser)
    }
    
    func testRegisterAStundentUserWithValidInput_RegisteredUserIsNotNil() {
        let user = UserEntity(identifier:"dummyId", email: "rherrera@test.com", accountType: AccountType.Student)
        gateway.registerResult = Result.success(user)
        usecase.register(email: "rherrera@test.com", password: "password", accountType: AccountType.Student)
        XCTAssertNotNil(gateway.registeredUser)
    }
    
    func testRegisterAStudentWithValidImput_RegisteredUserShouldBeTheSameAsAgateway() {
        let user = UserEntity(identifier:"dummyId", email: "rherrera@test.com", accountType: AccountType.Student)
        gateway.registerResult = Result.success(user)
        usecase.register(email: "rherrera@test.com", password: "password", accountType: AccountType.Student)
        XCTAssertEqual(gateway.registeredUser!, user)
    }
}
