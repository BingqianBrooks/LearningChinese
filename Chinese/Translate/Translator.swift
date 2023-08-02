//
//  Translator.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/28/23.
//

import Foundation
import Alamofire

//final class ModelTrans: ObservableObject {
//    @Published var translator: String = translate_request(APPID: "20230731001763719", passwd: "ROcQ5vdqTcwGKncfaqLI")
//}
class Translator{
    
    
    class func translate_request(ctent: String)-> String{
        
        let semaphore = DispatchSemaphore(value: 0)
        //(queue: DispatchQueue.global(qos: .default))
        let APPID: String = "20230731001763719"
        let passwd: String = "ROcQ5vdqTcwGKncfaqLI"
        //当前为英翻中
        //let ctent = "苹果"
        
        let random = "1435660288"
        
        //加密方法在另一个文件
        let encrypt = "\(APPID)\(ctent)\(random)\(passwd)".DDMD5Encrypt(.lowercase32)
        
        let encoding = ctent.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let address = "https://fanyi-api.baidu.com/api/trans/vip/translate?"+"q=\(encoding!)&from=zh&to=en&appid=\(APPID)&salt=\(random)&sign=\(encrypt)"
        
        //发送请求
        var ans: String = "None"
        AF.request(address,
                   method: .post).response (queue: DispatchQueue.global(qos: .default)){ response in
            switch response.result{
                
            case .success(let val):
                print("=======")
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {

                    let tmp = "[" + utf8Text + "]"
                    let tmp2 = tmp.data(using: .utf8)!
                            do {
                                if let jsonArray = try JSONSerialization.jsonObject(with: tmp2 ,options : .allowFragments) as? [Dictionary<String,Any>]
                                {
                                    if let rows = jsonArray[0]["trans_result"] as?  [[String:Any]] {
                                        print("Row=", rows)
                                        if let dst = rows[0]["dst"] as? String {
                                            print("dst=", dst)
                                            ans = dst
                                            print("ans*=", ans)
                                            semaphore.signal()
                                        }
                                    }
                                } else {
                                    print("bad json")
                                }
                            } catch let error as NSError {
                                print(error)
                            }
                        }

                    case .failure(let error):
                        print("Error while querying database: \(String(describing: error))")
                        return
                    }
        }
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("ans=", ans)
        return ans
    }
    
}

