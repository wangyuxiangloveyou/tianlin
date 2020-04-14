//
//  UILabel+Common.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zhb. All rights reserved.
//

import Foundation
import UIKit


extension UILabel{
    class func creatLabel(text:String?,textAlignmet:NSTextAlignment?,font:UIFont?)->UILabel{
        let label=UILabel()
        
        if let tmpText = text{
            label.text=tmpText
        }
        if let tmpAlignmet=textAlignmet{
            label.textAlignment=tmpAlignmet
        }
        if let tmpfont = font{
            label.font=tmpfont
        }
        return label
    }
}
//let ui = UILabel.creatLabel(text: T##String?, textAlignmet: <#T##NSTextAlignment?#>, font: T##UIFont?)

/**
 * UIColor的扩展类 将16进制颜色转换为RGB
 * @param hexString 16进制颜色字符串
 */
extension UIColor{
    convenience init(hexString: String) {
        let scanner:Scanner = Scanner(string:hexString)
        var valueRGB:UInt32 = 0
        if scanner.scanHexInt32(&valueRGB) == false {
            self.init(red: 0,green: 0,blue: 0,alpha: 0)
        }else{
            self.init(
                red:CGFloat((valueRGB & 0xFF0000)>>16)/255.0,
                green:CGFloat((valueRGB & 0x00FF00)>>8)/255.0,
                blue:CGFloat(valueRGB & 0x0000FF)/255.0,
                alpha:CGFloat(1.0)
            )
        }
    }
}

/**
 * 扩展UIColor 生成随机颜色
 */
extension UIColor {
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

/**
 * UIViewController 的扩展类 获取当前的ViewController
 * 使用时只需let nowVC = UIViewController.currentViewController()
 */
extension UIViewController {
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
}

/**
 * UITapGestureRecognizer 的扩展类 给手势添加一个tag属性
 */
private var tagKey: Int?
extension UITapGestureRecognizer {
    var gestureTag: Int? {
        get {
            return objc_getAssociatedObject(self, &tagKey) as? Int
        }
        set(newValue) {
            objc_setAssociatedObject(self, &tagKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
    }
}


/**
 * String 的扩展类
 * MD5 加密
 */


//extension String {
//    func getMD5() -> String {
//        let str = self.cString(using: String.Encoding.utf8)
//        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
//        CC_MD5(str!, strLen, result)
//        let hash = NSMutableString()
//        for i in 0..<digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        result.deinitialize(count: digestLen)
//        return String(hash)
//    }
//}



