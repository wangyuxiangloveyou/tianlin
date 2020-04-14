
//
//  UntreatedReadView.swift
//  TianLinStreetAdministration
//
//  Created by wangyuxiang on 2018/6/4.
//  Copyright © 2018年 TianLinStreetAdministration. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh


public var carId=""
public typealias OperationSelected = ((_ objct:AnyObject) -> Void)
class UntreatedReadView: UIView {
    var shouldLoadMoreData = true
    var index = 1
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    var pageNum=0
    var tableView:UITableView?
    var cellClourse:OperationSelected?
    var dataArray:[AnyObject]=[]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       // loadData1()
        tableView=UITableView(frame: CGRect(x: 0, y: 0, width:screenWidth , height: screenHeight-106), style: .plain)
        self.tableView?.layer.contents = UIImage(named:"mmexport1525609772323.jpg")?.cgImage
        self.layer.contents = UIImage(named:"mmexport1525609772323.jpg")?.cgImage
        self.tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView?.isScrollEnabled = true
        self.addSubview(tableView!)
        configUI()
    }
    
    func configUI()  {
        //创建表格试图
//        tableView=UITableView(frame: CGRect(x: 0, y: navigationBarHeight-44, width:screenWidth , height: screenHeight+navigationBarHeight-160), style: .plain)
        tableView?.dataSource=self
        tableView?.delegate=self
        
        tableView?.register(UINib(nibName: "UntreatedReadCell",bundle: nil), forCellReuseIdentifier: "UntreatedReadCellId")
    
        
        
//        // 下拉刷新
//        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
//        // 现在的版本要用mj_header
//        tableView?.mj_header = header
//        header.setTitle("", for: .idle)
//        header.setTitle("释放更新", for: .pulling)
//        header.setTitle("正在刷新...", for: .refreshing)
//        // 上拉加载
//        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
//        tableView?.mj_footer = footer
//        footer.setTitle("", for: .idle)
//        footer.setTitle("释放加载", for: .pulling)
//        footer.setTitle("正在加载...", for: .refreshing)
//        footer.setTitle("没有更多数据", for: .noMoreData)

    }
//    //顶部刷新
//    func headerRefresh(){
//        print("下拉刷新")
//        // 结束刷新
//        // self.tableView?.mj_header.beginRefreshing()
//        index=1
//        loadData1()
//    }
    
    // 底部刷新
    
//    func footerRefresh()
//    {
//        index = index + 1
//        // self.tableView?.mj_footer.beginRefreshing()
//        if shouldLoadMoreData {
//            loadData1()
//        } else {
//            self.tableView!.mj_footer.endRefreshingWithNoMoreData()
//        }
//    }
//
//    func startRefreshData1()
//    {
//        self.tableView?.mj_header.beginRefreshing()
//        index = 1
//        loadData1()
//    }
//    //获取停车未读事件列表
//    func loadData1()
//    {
//        print("123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789")
//        let parameters: Parameters = [
//            "head":[
//                "platform":"app",
//                "timestamp":timeStamp,
//                "token":token1,
//                "longitude":longitude,
//                "latitude":latitude,
//            ],
//            "villageIDs":villageArray,
//            "status":0,
//            "pageNum":index,
//            "pageSize":15,
//            ]
//
//        Alamofire.request("http://47.75.190.168:5000/api/app/getParkingEventList", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ (response)  in
//            print(token1)
//
//            print("获取停车未读事件列表")
//            print(villageArray)
//            if let dic = response.result.value {
//
//                let data : NSData! = try? JSONSerialization.data(withJSONObject: dic, options: []) as NSData!
//                let json = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
//                print("json: \(json)")
//                print(dic)
//
////                if (json?.length)! >= 60{
//                    let model1:UntreatedReadModel = UntreatedReadModel.mj_object(withKeyValues: dic)
//                if model1.responseStatus?.resultCode == 0 && model1.events != nil {
//                    let c =  model1.events!.count
//                    self.shouldLoadMoreData = c >= 20
//                    if c>0
//                    {
//                        if self.index > 1
//                        {
//                            for i in 0..<c
//                            {
//                                self.dataArray.append(model1.events![i])
//                            }
//                        }
//                        else if self.index == 1
//                        {
//                            self.dataArray = model1.events!
//                        }
//                    }
//                    else
//                    {
//                        //self.tableView!.mj_footer.endRefreshingWithNoMoreData()
//                    }
//                }
//            }
//            else
//            {
//                print("dic: \(response)")
//            }
//             print("self.dataArray.count: \(self.dataArray.count)")
//            // 结束刷新
//            self.tableView?.reloadData()
//            self.configUI()
//            self.tableView?.mj_header.endRefreshing()
//            self.tableView?.mj_footer.endRefreshing()
//
//        }
//    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



extension UntreatedReadView:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("self.dataArray.count: \(self.dataArray.count)")
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UntreatedReadCell = tableView.dequeueReusableCell(withIdentifier: "UntreatedReadCellId", for: indexPath as IndexPath) as! UntreatedReadCell
        //let model:UntreatedReadEventsModel=self.dataArray[indexPath.row] as! UntreatedReadEventsModel
        cell.timeLabel.text="2018-09-09"
        cell.timeLabel.textColor=UIColor.init(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        
        cell.carLabel.text="小区车辆低于85%"
        cell.carLabel.textColor=UIColor.init(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        
         cell.numberLabel.text="田林12村-幸福小区"
        cell.numberLabel.textColor=UIColor.red
        
        cell.allLabel.text="违规车辆是10辆"
        cell.allLabel.textColor=UIColor.init(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)
        cell.chooseClourse = {
            () in
            if self.cellClourse != nil {
               //let  id1=model.eventID!
                self.cellClourse!(1 as AnyObject)
            }
        }
        cell.chooseButton.setTitle("确定反馈", for: .normal)
        cell.chooseButton.tintColor=UIColor.white
        cell.chooseButton.backgroundColor=UIColor.init(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        cell.selectionStyle = .none
        return cell
        
    }
}

