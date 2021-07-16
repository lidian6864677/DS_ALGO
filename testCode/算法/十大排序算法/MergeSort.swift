//
//  MergeSort.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa

/// 归并排序
class MergeSort: BaseSort {
    var leftArray = [NSInteger]()
    override func sortAction() {
        leftArray = [NSInteger](repeating: 0, count: arrayList.count >> 1)
        divide(0, arrayList.count)
    }
    // 分割
    func divide(_ begin: NSInteger, _ end: NSInteger){
        if end - begin < 2 { return }
        let mid = (begin+end) >> 1
        divide(begin, mid)
        divide(mid, end)
        merge(begin, mid, end)
    }
    // 合并
    func merge(_ begin: NSInteger, _ mid: NSInteger, _ end: NSInteger){
        var li = 0, le = mid-begin
        var ri = mid, re = end
        var ai = begin
        for i in li..<le {
            leftArray[i] = arrayList[begin+i]
        }
        while li<le {
            if ri<re && cmpValue(arrayList[ri], leftArray[li])<0 {
                arrayList[ai] = arrayList[ri]
                ai+=1; ri+=1
            }else{
                arrayList[ai] = leftArray[li]
                ai+=1; li+=1
            }
        }
    }
}
