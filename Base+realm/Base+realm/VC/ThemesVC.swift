//
//  ViewController.swift
//  realm
//
//  Created by Андрей Коноплев on 11/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import UIKit
import RealmSwift

class ThemesVC: UITableViewController {

    private lazy var realm = try? Realm()
    private lazy var themes = realm?.objects(ThemeModel.self)
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ParseJSONService.parseThemes(db: realm)
        ParseJSONService.parseQuestion(db: realm)
        print(realm?.configuration.fileURL)
        addObserver()

    }
    
    deinit {
        token?.invalidate()
    }
    
    func addObserver()-> Void {
        token = themes?.observe({ [weak self] (changes) in
            guard let self = self else { return }
            switch changes {
            case .initial(_):
                self.tableView.reloadData()
            case .update(_ , deletions: let del, insertions: let ins, modifications: let mod):
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: del.map { IndexPath(row: $0, section: 0)}, with: .fade)
                self.tableView.insertRows(at: ins.map { IndexPath(row: $0, section: 0)}, with: .middle)
                self.tableView.reloadRows(at: mod.map{ IndexPath(row: $0, section: 0)} , with: .fade)
                self.tableView.endUpdates()
            case .error(let error):
                assertionFailure(error.localizedDescription)
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themes?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = themes?[indexPath.row].name ?? ""
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toQuestion", sender: self.themes?[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let dest = segue.destination as? QuestionVC {
            dest.theme = sender as? ThemeModel
        }
        
    }
}

