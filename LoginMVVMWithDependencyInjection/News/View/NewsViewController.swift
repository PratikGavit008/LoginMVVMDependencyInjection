//
//  NewsViewController.swift
//  LoginMVVMWithDependencyInjection
//
//  Created by Madhuri Yerudkar on 04/12/22.
//

import UIKit

protocol NewsViewControllerProtocol: AnyObject {
    func displayList()
}

class NewsViewController: UIViewController, HasDependencies {
    lazy var viewModelDelegate: NewsViewModelProtocol = dependencies.resolveNewsViewModel()
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // 1
        viewModelDelegate.getNewsList()
    }
    

    /*
    // MARK: -

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsViewController: NewsViewControllerProtocol {
    func displayList() {
        //3. Reload data
        tableView.reloadData()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //4.
        return viewModelDelegate.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UITableViewCell else {
            fatalError()
        }
        // 6.
        let model = viewModelDelegate.getNewsModel(indexPath: indexPath)
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.desc
        return cell
    }
}
