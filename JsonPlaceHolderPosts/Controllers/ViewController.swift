//
//  ViewController.swift
//  JsonPlaceHolderPosts
//
//  Created by Lakhlifi Essaddiq on 4/12/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
   
    
    var list = ["data1","data2","data3"]
    
    var postsList = [Post]()
    
    var albumsList = [Album]()
    
    var employeeList = [Employee]()
    
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource  = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        //getAlbumFromApi()
        getEmployeesFromApi()
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        getPostsFromApi()
//    }
    
    func getEmployeesFromApi(){
        AF.request("http://dummy.restapiexample.com/api/v1/employees").responseJSON{
            data in
            guard let dataValue = data.value  else { return }
            let json = JSON(dataValue)
            
            let empData = json["data"]
            //print(empData)
            
            for (_ , emp) : (String , JSON) in empData{
                
               
                guard  let name = emp["employee_name"].string , let age = emp["employee_age"].string else {
                    return
                }
                
                self.employeeList.append(Employee(name:  name , age: Int(age)! ))
  
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
//
        }
    }
//
//    func getAlbumFromApi(){
//        AF.request("https://jsonplaceholder.typicode.com/albums").responseJSON{
//            (data) in
//            guard let dataValue = data.value else { return}
//
//            let json = JSON(dataValue)
//
////            print(json[0]["title"])
//
//            for (_ , album) : (String, JSON) in json{
//                if let id = album["id"].int ,let userId = album["userId"].int , let title = album["title"].string  {
////                    print(title)
//                    self.albumsList.append(Album(userId: userId, id: id, title: title))
//                }
//
//            }
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }
    
    func getPostsFromApi(){
//        AF.request("https://jsonplaceholder.typicode.com/posts").responseJSON{
//            data in
//
//            guard let data = data.value else {
//                return
//            }
//
//                let json =  JSON(data)
//
//                for (_,post):(String, JSON) in json {
//                    if let id = post["id"].int, let userId = post["userId"].int, let title = post["title"].string, let body = post["body"].string  {
//                        self.postsList.append(Post(id: id, userId: userId, title: title, body: body))
//                    }
//                }
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//
//        }
        
//        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//
//                let json = JSON(value)
//
//                for (_,post):(String, JSON) in json {
//                    if let id = post["id"].int, let userId = post["userId"].int, let title = post["title"].string, let body = post["body"].string  {
//                        self.postsList.append(Post(id: id, userId: userId, title: title, body: body))
//                    }
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//
//                //print("JSON: \(json)")
//            case .failure(let error):
//                print(error)
//            }
//        }
//
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emp = employeeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for:  indexPath)
        cell.textLabel?.text = "name : \(emp.name) age:  \(emp.age)"
        return cell
    }


}

