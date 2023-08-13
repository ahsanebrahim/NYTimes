// 
//  NYTimesListViewController.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import UIKit

class NYTimesListViewController: UIViewController, NYTimesListViewProtocol {
    // MARK: - Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Attributes
	var presenter: NYTimesListPresenterProtocol!

    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - Init
    convenience init() {
        self.init(nibName: "\(NYTimesListViewController.self)", bundle: nil)
    }

    // MARK: - Deallocation
    deinit {
        debugPrint("\(NYTimesListViewController.self)  release from memory")
    }
}

// MARK: - Setup UI
extension NYTimesListViewController {
    
    func setupUI() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "NY Times Most Popular"
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 118
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

//MARK: - TableView Delegate and DataSource
extension NYTimesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell" , for: indexPath) as? NewsTableViewCell else { return UITableViewCell()}
        presenter.configure(newsCell: cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(cellAt: indexPath)
    }
    
}
