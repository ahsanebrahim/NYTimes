// 
//  NYTimesDetailViewController.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NYTimesDetailViewController: UIViewController, NYTimesDetailViewProtocol {
    // MARK: - Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    
    // MARK: - Attributes
	var presenter: NYTimesDetailPresenterProtocol!

    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    convenience init() {
        self.init(nibName: "\(NYTimesDetailViewController.self)", bundle: nil)
    }

    // MARK: - Deallocation
    deinit {
        debugPrint("\(NYTimesDetailViewController.self)  release from memory")
    }
}

// MARK: - Setup UI
extension NYTimesDetailViewController {
    
    func setupUI() {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Details"
    }
    
    func setupLabels(model: NewsResults) {
        titleLabel.text = model.title
        descriptionTextView.text = model.abstract
    }
}
