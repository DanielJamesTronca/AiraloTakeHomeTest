//
//  FetchLocalEsimUseCaseTests.swift
//  AiraloTestTests
//
//  Created by TRONCA DANIEL JAMES on 19/06/24.
//

import XCTest
import Combine
@testable import AiraloTest

final class FetchLocalEsimUseCaseTests: XCTestCase {

    private var fetchLocalEsimUseCase: FetchLocalEsimUseCaseImplementation!
    private var mockEsimRepository: MockEsimRepository!
    
    private final class MockEsimRepository: EsimRepository {
        func fetchCountryPackages(for esimId: String) async throws -> CountryPackages { throw NetworkError.unknown }
        
        var result: Result<LocalEsim, Error> = .success([LocalEsimElement.stub()])
        
        func fetchLocalEsim() async throws -> LocalEsim {
            switch result {
            case .success(let localEsim):
                return localEsim
            case .failure(let error):
                throw error
            }
        }
    }
    
    override func setUp() {
        super.setUp()
        mockEsimRepository = MockEsimRepository()
        fetchLocalEsimUseCase = FetchLocalEsimUseCaseImplementation(esimRepository: mockEsimRepository)
    }
    
    override func tearDown() {
        fetchLocalEsimUseCase = nil
        mockEsimRepository = nil
        super.tearDown()
    }
    
    func testFetchLocalEsimSuccess() async {
        // Given
        mockEsimRepository.result = .success([LocalEsimElement.stub()])
        // When
        do {
            let localEsim = try await fetchLocalEsimUseCase.execute()
            // Then
            XCTAssertEqual(localEsim.first?.id, 10)
            XCTAssertEqual(localEsim.first?.title, "title")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
    
    func testFetchLocalEsimFailure() async {
        // Given
        mockEsimRepository.result = .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
        // When
        do {
            _ = try await fetchLocalEsimUseCase.execute()
            XCTFail("Expected failure but got success")
        } catch {
            // Then
            XCTAssertEqual((error as NSError).domain, "TestError")
            XCTAssertEqual((error as NSError).code, 1)
        }
    }
}
