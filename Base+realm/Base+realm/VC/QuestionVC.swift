//
//  QuestionVC.swift
//  Base+realm
//
//  Created by Андрей Коноплев on 12/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import UIKit
import RealmSwift

class QuestionVC: UITableViewController {

   var theme: ThemeModel?
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Вопросы"
        self.tableView.tableFooterView = UIView()
        addObserv()
    }
    
    deinit {
        token?.invalidate()
    }
    
    func addObserv()-> Void {
        token = theme?.questionsList.observe({ [weak self] (changes) in
            switch changes {
            case .initial(_):
                self?.tableView.reloadData()
            case .update(_, deletions: let del, insertions: let add, modifications: let upd):
                self?.tableView.beginUpdates()
                self?.tableView.deleteRows(at: del.map{ IndexPath(row: $0, section: 0) }, with: .automatic)
                self?.tableView.insertRows(at: add.map{ IndexPath(row: $0, section: 0) }, with: .automatic)
                self?.tableView.reloadRows(at: upd.map{ IndexPath(row: $0, section: 0) }, with: .none)
                self?.tableView.endUpdates()
            case .error(let error):
                assertionFailure(error.localizedDescription)
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theme?.questionsList.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = theme?.questionsList[indexPath.row].question
        cell.textLabel?.numberOfLines = 0
        return cell
    }



}
