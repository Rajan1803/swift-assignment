//
//  WebServiceMainVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/06/23.
//

import UIKit
//import Reachability

struct Person: Codable {
    var name: String
    var age: Int
}
class WebServiceMainVC: UIViewController {

    // MARK: - Variables And Declarations
    let jsonString = """
        {"page":1,"per_page":6,"total":12,"total_pages":2,"data":[{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"},{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},{"id":3,"email":"emma.wong@reqres.in","first_name":"Emma","last_name":"Wong","avatar":"https://reqres.in/img/faces/3-image.jpg"},{"id":4,"email":"eve.holt@reqres.in","first_name":"Eve","last_name":"Holt","avatar":"https://reqres.in/img/faces/4-image.jpg"},{"id":5,"email":"charles.morris@reqres.in","first_name":"Charles","last_name":"Morris","avatar":"https://reqres.in/img/faces/5-image.jpg"},{"id":6,"email":"tracey.ramos@reqres.in","first_name":"Tracey","last_name":"Ramos","avatar":"https://reqres.in/img/faces/6-image.jpg"}],"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
        """
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // function to understand JSONDecoder
    func jsonDataDecodeDemo() {
        let jsonData = Data(jsonString.utf8)
        
        do {
            let people = try JSONDecoder().decode(Welcome.self, from: jsonData)
            print(people)
        } catch {
            print(error.localizedDescription)
        }
    }

    // MARK: - IBActions
    @IBAction func btnGetNewsClicked(_ sender: UIButton) {

    }
    

    func decodeJson() {
        let jsonString = """
        [
            {
                "name": "Taylor Swift",
                "age": 26
            },
            {
                "name": "Justin Bieber",
                "age": 25
            }
        ]
        """

        let jsonData = Data(jsonString.utf8)
        let decoder = JSONDecoder()

        do {
            let people = try decoder.decode([Person].self, from: jsonData)
            print(people)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getRequest() {
        let url = RequestItemsType.getNews.url
        let urlRequest = URLRequest(url: url)
        
//        guard let url else {return }
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data , response, error in
            guard let responseData = data else {
                return
            }
            if let error = error {
                   print("Error with fetching films: \(error)")
                   return
                 }
                 
                 guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                     print("Error with the response, unexpected status code: ",response)
                   return
                 }
            
            do {
                let json = try JSONSerialization.jsonObject(with: responseData,options: [])
                print(json)
                
            }catch let error {
                print(error)
            }
            
        
            
        })
        task.resume()
    }
    
    func postRequest() {
        let user = User(job: "leader", name: "morpheus")
        guard let url = URL(string: "https://reqres.in/api/users") else {return}
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        do {
            urlRequest.httpBody = try JSONEncoder().encode(user)
        }catch let error {
            print(error)
        }
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let error {
                print("error", error)
            }
            guard let responsData = data else {return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: responsData,options: [])
            }catch let error {
                print(error)
            }
        })
        
        task.resume()
        
        
    }
    
    func demoRequestAndDecode() {
        let urlStr = "https://reqres.in/api/users?page=2"
        
        guard let url = URL(string: urlStr) else {return }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data,response , error in
            
            
            if let error {
                print(error)
                return
            }
            
            guard let responseData = data else {return }
            do{
                let json = try JSONDecoder().decode(Welcome.self, from: responseData)
            } catch {
                print(error)
            }
            
            
            
        })
        
        task.resume()
        
        
    }
    
    func encoderDemo() {
        
        let user = User(job: "SE", name: "Rajan")
        
        do{
            let encoded = try JSONEncoder().encode(user)
        }catch {
            print(error)
        }
        
        
        
        
    }
    
}


