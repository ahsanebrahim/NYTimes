//
//  NYTimesDetailsTests.swift
//  NYTimesTests
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import XCTest
@testable import NYTimes

final class NYTimesDetailsTests: XCTestCase {
    
    var presenter: NYTimesDetailPresenterProtocol!
    
    override func setUp() {
        let view = NYTimesDetailViewController()
        let interactor = NYTimesDetailInteractor()
        let router = NYTimesDetailRouter()
        presenter = NYTimesDetailPresenter(view: view, interactor: interactor, router: router, model: NewsResults())
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPresenterInitialization() throws {
       XCTAssertNotNil(presenter, "Presenter should not be nil after initialization")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
