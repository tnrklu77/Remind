import UIKit
import UserNotifications
import PureLayout



class HomeViewController: UIViewController, UNUserNotificationCenterDelegate, UITableViewDelegate {
    
    
    private var mainView = MainView.newAutoLayout()
    var tableView : UITableView!
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    let notifications = ["Simple Local Notification",
                         "Local Notification with Action",
                         "Local Notification with Content",]
    var alertData = [AlertModel]()
    var subtitleData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)

        view.backgroundColor = UIColor(red: 79/255, green: 79/255, blue: 79/255, alpha: 1)
        insertView(mainView)
        mainView.remindButton.addTarget(self, action: #selector(sendBtn), for: .touchUpInside)
        insertTableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        

        
        tableView.backgroundColor = UIColor(red: 79/255, green: 79/255, blue: 79/255, alpha: 1)

    }

   private var mainViews : UIView?
    func insertView(_ main: UIView?) {
        mainViews = main
        

        guard let mainView = main else {
            return
        }
        
        view.addSubview(mainView)

        mainView.autoPinEdge(.left, to: .left, of: view)
        mainView.autoPinEdge(.right, to: .right, of: view )

        mainView.autoPinEdge(toSuperviewEdge: .top)
        mainView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 385)
        



      }
    private func insertTableView() {
        self.tableView = UITableView.newAutoLayout()
        

        
        tableView?.register(AlertTableViewCell.self, forCellReuseIdentifier: AlertTableViewCell.identifier)
        guard let tableView = tableView else {
                  return
              }

        
        
        
        
        view.addSubview(tableView)


        tableView.autoPinEdge(.left, to: .left, of: view, withOffset: 40 )
        tableView.autoPinEdge(.right, to: .right, of: view, withOffset: -40)
        tableView.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: -40)
        tableView.autoPinEdge(.top, to: .bottom, of: mainView.remindButton , withOffset: 40)

    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
        
    
    @objc func sendBtn(){
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        let title = "Remember!"
        let message = mainView.messageTextField.text ?? "Great Idea"
        if mainView.messageTextField.text != ""  {
//            && titleTextField.text != ""
        
        let okAction = UIAlertAction(title: "Okay, I will wait", style: .default) { [self] (action) in
            let notificationType = notifications
            self.appDelegate?.scheduleNotification(notificationType: notificationType.last! )
              }
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            
        }

        let content = UNMutableNotificationContent()
        
            
            

            
        content.title = title

        content.body = message
        content.subtitle = mainView.subtitleTextField.text ?? "You did not say anything"
        content.sound = .defaultCritical

        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
                    
            
           
//        STEP 3 NOTİFİCATİON TRİGGER
            
            let date = mainView.datePicker.date
//
          
       
            
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
//         STEP 4 REQUEST
            
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
//        STEP 5 REGİSTER THE REQUEST
            
        center.add(request) { (error) in
             
        }
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "HH:mm"
            let stringDate = dateFormat.string(from: date)
          
  
            
            alertData.append(AlertModel(subtitle: mainView.subtitleTextField.text ?? "You did not say anything", message: message, date: stringDate))
            UserDefaults.standard.set(mainView.subtitleTextField.text, forKey: "SubtitleText")
            UserDefaults.standard.set(message, forKey: "MessageText")
            UserDefaults.standard.set(stringDate, forKey: "StringDate")
            subtitleData.append("\((UserDefaults.standard.value(forKey: "SubtitleText")!))")
            print("\(UserDefaults.standard.value(forKey: "SubtitleText")!)....")
            print("\(UserDefaults.standard.value(forKey: "MessageText")!)....")
            print("\(UserDefaults.standard.value(forKey: "StringDate")!)....")

            print("\(subtitleData)....sa")
            self.mainView.subtitleTextField.text = ""
            self.mainView.messageTextField.text = ""
        }
         
        
    
    
    }

}


    

    

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertData.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: AlertTableViewCell.identifier, for: indexPath) as! AlertTableViewCell
        cell.backgroundColor = UIColor(red: 79/255, green: 79/255, blue: 79/255, alpha: 1)
        
        
        
        
//        if alertList != nil{
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
            let alertLists = alertData[indexPath.row]
            
            cell.messageText.text = "\(alertLists.message)"
            cell.subtitleLbl.text = "\(alertLists.subtitle)"

        cell.dateLbl.text = "\(alertLists.date)"
        

        tableView.rowHeight = 70
        
  
        return cell
    
    }
    
    

}
