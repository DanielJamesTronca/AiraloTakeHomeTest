//
//  LocalEsimViewModelTests.swift
//  AiraloTestTests
//
//  Created by TRONCA DANIEL JAMES on 19/06/24.
//

import XCTest
import Combine
@testable import AiraloTest

final class LocalEsimViewModelTests: XCTestCase {

    private weak var weakSut: LocalEsimViewModel?

    override func tearDown() {
        super.tearDown()
        XCTAssertNil(weakSut)
    }
    
    private final class MockFetchLocalEsimUseCase: FetchLocalEsimUseCase {
        var result: Result<LocalEsim, Error> = .success([LocalEsimElement.stub()])

        func execute() async throws -> LocalEsim {
            switch result {
            case .success(let localEsim):
                return localEsim
            case .failure(let error):
                throw error
            }
        }
    }

    func testDidTapLocalEsim() {
        // Given
        let expectation = XCTestExpectation(description: "Action didTapCountry is called")
        let actions = LocalEsimActions(didTapCountry: { esim in
            XCTAssertEqual(esim.id, 10)
            expectation.fulfill()
        })
        let sut = makeSut(actions: actions)
        // When
        sut.didTapLocalEsim(esim: LocalEsimElement.stub())
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}

extension LocalEsimViewModelTests {
    private func makeSut(
        actions: LocalEsimActions,
        fetchLocalEsimUseCase: any FetchLocalEsimUseCase = MockFetchLocalEsimUseCase()
    ) -> LocalEsimViewModel {
        let sut = LocalEsimViewModel(actions: actions, fetchLocalEsimUseCase: fetchLocalEsimUseCase)
        weakSut = sut
        return sut
    }
}
