//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Ahsan Ebrahim Khatri on 11/08/2023.
//

import XCTest
@testable import NYTimes

final class NYTimesTests: XCTestCase {
    
    var presenter: NYTimesListPresenter!

    override func setUp() {
        let view = NYTimesListViewController()
        let dataSource = ServicesDataSource(apiService: ServicesAPI())
        let repository = ServicesRepository(dataSource: dataSource)
        let interactor = NYTimesListInteractor(repository: repository)
        let router = NYTimesListRouter()
        presenter = NYTimesListPresenter(view: view, interactor: interactor, router: router)
        
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
    
    func testDataSource() {
        presenter.fetchMostUsedAPI()
        wait(for: 5)
        XCTAssertFalse(presenter.getNumberOfRows() == 0, "After succesful API, datasource should have a response greater than zero")
    }
}

extension XCTestCase {

  func wait(for duration: TimeInterval) {
    let waitExpectation = expectation(description: "Waiting")

    let when = DispatchTime.now() + duration
    DispatchQueue.main.asyncAfter(deadline: when) {
      waitExpectation.fulfill()
    }

    // We use a buffer here to avoid flakiness with Timer on CI
    waitForExpectations(timeout: duration + 0.5)
  }
}
