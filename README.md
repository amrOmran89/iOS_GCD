# iOS Grand Central Dispatch

## DispatchGroup()

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let groupOne = ["user 1 😀", "user 2 ☺️", "user 3 😅"]
    let groupTwo = ["user 4 🥰", "user 5 😎", "user 6 😛"]
    let groupThree = ["user 7 😡", "user 8 😍", "user 9 🤪"]
    
    var groupUser: [String] = []
    
    private let dispatchGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "DispatchGroup"
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func run(after seconds: Int, completion: @escaping () -> Void) {
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }
    }
    
    func getGroupOne() {
        dispatchGroup.enter()
        run(after: 2) {
            self.groupUser.append(contentsOf: self.groupOne)
            self.dispatchGroup.leave()
            print("group one complete 😊")
        }
    }
    
    func getGroupTwo() {
        dispatchGroup.enter()
        run(after: 4) {
            self.groupUser.append(contentsOf: self.groupTwo)
            print("group two complete 😊")
            self.dispatchGroup.leave()
        }
    }
    
    func getGroupThree() {
        dispatchGroup.enter()
        run(after: 6) {
            self.groupUser.append(contentsOf: self.groupThree)
            print("group three complete 😊")
            self.dispatchGroup.leave()
        }
    }

    @IBAction func download(_ sender: Any) {
        getGroupOne()
        getGroupTwo()
        getGroupThree()
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    @IBAction func cancel(_ sender: Any) {
        self.groupUser.removeAll()
        self.tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groupUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.label.text = groupUser[indexPath.row]
        return cell
    }
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}

```
