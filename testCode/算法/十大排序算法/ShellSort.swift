//
//  ShellSort.swift
//  算法
//
//  Created by DianLee on 2021/7/12.
//

import Cocoa

/// 希尔排序
class ShellSort: BaseSort {
    
    
    override func sortAction() {
        let stepSequence = creatShellStepSequence() // 步长序列
        for step in stepSequence {
            sort(step)
        }
    }
    
    func sort(_ step:NSInteger)  {
        
    }
    
    
    func creatShellStepSequence() -> [NSInteger] {
        var list = [NSInteger]()
        var length = arrayList.count >> 1
        while length > 0 {
            list.append(length)
            length = length >> 1
        }
        return list
    }
    func creatMineStepSequence() -> [NSInteger] {
        
        
        return []
    }

}
