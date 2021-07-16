//
//  BaseSort.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa


class BaseSort: NSObject {
    
    var arrayList = [NSInteger]()  // 需要排序的数组
    var swapCount = 0   // 交换次数
    var cmpCount = 0    // 比较次数
    fileprivate func sort(array: [NSInteger]) {
        arrayList = array
        if arrayList.count <= 100 {
            print("\n\n原始数据:\(arrayList)")
        }
        
        let startTime = CFAbsoluteTimeGetCurrent()
        sortAction()
        let endTime = CFAbsoluteTimeGetCurrent()
        
        let sortTitle = self.className
        if arrayList.count <= 100 {
            print("""
            【\(sortTitle)】
            执行时间：\(endTime - startTime)      比较次数：\(cmpCount)      交换次数：\(swapCount)
            排序后数据:\(arrayList)
            ---------------------------------------------------------------------------------
            """)
        }else{
            print("""
            【\(sortTitle)】
            执行时间：\(endTime - startTime)      比较次数：\(cmpCount)      交换次数：\(swapCount)
            ---------------------------------------------------------------------------------
            """)
        }
        
 
    }
//    排序后数据:\(arrayList)
    func sortAction(){ }
    
    /// 比较两个元素的大小  等于0:v1=v2  小于0:v1<v2   大于0:v1>v2
    func cmpValue(_ v1: NSInteger, _ v2: NSInteger) -> Int {
        cmpCount += 1
        return v1 - v2
    }
    func cmpIndex(_ index1: NSInteger, _ index2: NSInteger) -> Int {
        let v1 = arrayList[index1]
        let v2 = arrayList[index2]
        return cmpValue(v1, v2)
    }
    func swap(_ index1: NSInteger, _ index2: NSInteger) {
        let temp = arrayList[index1]
        arrayList[index1] = arrayList[index2]
        arrayList[index2] = temp
        swapCount += 1
    }
}

/// 创建一个随机数组
func createRandom(count: NSInteger, min: NSInteger, max: NSInteger) -> [NSInteger]{
    var array = [NSInteger]()
    for _ in 0..<count {
        let v = Int(arc4random_uniform(UInt32(max)))+min
        array.append(v)
    }
    return array
}

func testSorts(array:[NSInteger], _ objs:BaseSort...){
    for obj in objs {
        obj.sort(array: array)
    }
}

