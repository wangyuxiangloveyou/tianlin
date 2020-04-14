//
//  DrugAddictsDetailsCell.swift
//  TianLinStreetAdministration
//
//  Created by wangyuxiang on 2018/7/12.
//  Copyright © 2018年 TianLinStreetAdministration. All rights reserved.
//

import UIKit

class DrugAddictsDetailsCell: UITableViewCell {
    var model1:alarmsDetailsModel?
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var peopleLabel: UILabel!
    
    
    @IBOutlet weak var timeTableView: UITableView!
    @IBOutlet weak var suspiciousLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgView.layer.shadowColor = UIColor.black.cgColor;
        self.bgView.layer.shadowOpacity = 0.30;
        self.bgView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.timeTableView?.isScrollEnabled = true
        self.timeTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.timeTableView?.allowsSelection = false
        timeTableView.delegate=self
        timeTableView.dataSource=self
        timeTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        

    }

    func refreshData(model:alarmsDetailsModel){
        model1=model
        print(model)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension DrugAddictsDetailsCell:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(model1?.trafficRecords?.count)
        print(model1?.visitorRecords?.count)
//        if model1?.trafficRecords != nil && model1?.visitorRecords == nil{
//            return (model1?.trafficRecords?.count)!
//        }
//        if model1?.trafficRecords == nil && model1?.visitorRecords != nil{
//            return (model1?.visitorRecords?.count)!
//        }

       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print(model1?.trafficRecords?.count)
        print(model1?.visitorRecords?.count)
        //cell.textLabel?.text="121eretwhekmgosdmg,mg"
        cell.textLabel?.numberOfLines=0
        cell.textLabel?.font=UIFont.systemFont(ofSize: 13)
        if (model1?.trafficRecords?.count)! > 0  && model1?.visitorRecords?.count == 0{
             var text = ""
            for i in 0..<(model1?.trafficRecords)!.count{
                text = text+(model1?.trafficRecords![i])!+"    "
            }
             cell.textLabel?.text="通行记录:\n"+text
       }
        
        if (model1?.trafficRecords?.count)! == 0 && (model1?.visitorRecords?.count)! > 0{
            var text = ""
            for i in 0..<(model1?.visitorRecords)!.count{
                text = text+(model1?.visitorRecords![i])!+"    "
            }
            cell.textLabel?.text="访客记录:\n"+text
        }
        return cell
    }
    
    
}
