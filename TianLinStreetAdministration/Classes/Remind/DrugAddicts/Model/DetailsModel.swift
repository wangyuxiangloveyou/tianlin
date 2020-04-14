//
//  DetailsModel.swift
//  TianLinStreetAdministration
//
//  Created by wangyuxiang on 2018/7/26.
//  Copyright © 2018年 TianLinStreetAdministration. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import Toast_Swift
import MBProgressHUD
import MJExtension


@objc(DetailsModel)
class DetailsModel: NSObject {
    var alarms:[alarmsDetailsModel]?
    var responseStatus:DetailsStatusModel?
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["alarms" :NSStringFromClass(alarmsDetailsModel.self)]
    }
}

class alarmsDetailsModel: NSObject,NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        let alarmsDetailsModel1=alarmsDetailsModel()
        alarmsDetailsModel1.state=self.state
        alarmsDetailsModel1.alarmID=self.alarmID
        alarmsDetailsModel1.alarmTime=self.alarmTime
        alarmsDetailsModel1.buildingNo=self.buildingNo
        alarmsDetailsModel1.houseNo=self.houseNo
        alarmsDetailsModel1.peopleName=self.peopleName
        alarmsDetailsModel1.tag=self.tag
        alarmsDetailsModel1.resultType=self.resultType
        alarmsDetailsModel1.trafficRecords=self.trafficRecords
        alarmsDetailsModel1.visitorRecords=self.visitorRecords
         return alarmsDetailsModel1
    }
    
    var alarmTime:String?
    var alarmID:String?
    var buildingNo:String?
    var houseNo:NSNumber?
    var state:NSNumber?
    var peopleName:String?
    var tag:[Any]?
    var bool1:NSNumber!
    var resultType:NSNumber?
    var trafficRecords:[String]?
    var visitorRecords:[String]?
//    override func mj_keyValuesDidFinishConvertingToObject() {
//        self.trafficRecords = trafficRecordsModel.mj_objectArray(withKeyValuesArray: self.trafficRecords).copy() as? [trafficRecordsModel]
//         self.visitorRecords = visitorRecordsModel.mj_objectArray(withKeyValuesArray: self.visitorRecords).copy() as? [visitorRecordsModel]
//    }
}

class DetailsStatusModel: NSObject {
    var resultCode:NSNumber?
    var resultMessage:String?
}
//class trafficRecordsModel: NSObject {
//    
////    func copy(with zone: NSZone? = nil) -> Any {
////        let trafficRecordsModel1=trafficRecordsModel()
////        trafficRecordsModel1.modelID=self.modelID
////        trafficRecordsModel1.modelName=self.modelName
////        trafficRecordsModel1.unsolveNum=self.unsolveNum
////        return trafficRecordsModel1
////    }
////    var modelID:String?
////    var modelName:String?
////    var unsolveNum:String?
//}
//
//class visitorRecordsModel: NSObject {
//    
////    func copy(with zone: NSZone? = nil) -> Any {
////        let visitorRecordsModel1=visitorRecordsModel()
////        visitorRecordsModel1.modelID=self.modelID
////        visitorRecordsModel1.modelName=self.modelName
////        visitorRecordsModel1.unsolveNum=self.unsolveNum
////        return visitorRecordsModel1
////    }
////    var modelID:String?
////    var modelName:String?
////    var unsolveNum:String?
//}
//
