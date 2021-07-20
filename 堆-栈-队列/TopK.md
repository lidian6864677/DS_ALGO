# TopK问题



## 题目

从N个整数中，找出最大的前k个数 （k 小于 N）

示例 1：

```
输入： 4,5,1,6,2,7,3,8  找前3个最大的数
最大的3个数字：6,7,8
```

## 解题

### 思路一 ：全排序 

1. 使用排序解决

 时间复杂度：O(nlogn)

```swift

```

### 思路二： 二叉堆

1. 新建一个小顶堆
2. 扫描n个整数
   1. 先将遍历到的钱k个数放入堆中
   2. 从第k+1个数开始，如果大于堆顶元素，就是使用replace操作（删除堆顶元素，将第k+1个数添加到堆中）
3. 扫描完毕后，堆中剩下的就是最大的前k个数

 时间复杂度：nlogk

```swift
func getTopK(_ nums:[Int], _ k: NSInteger) -> [Int] {
    if nums.count <= 0 || k <= 0 {return []}
    let minHeap = Heap<Int>()
    for i in 0..<nums.count  {
        let value = nums[i]
        if minHeap.size < k {
            minHeap.addElement(nums[i])
        }else if (value > minHeap.getElement()!){
            minHeap.replaceElement(nums[i])
        }
    }
    return minHeap as? [Int] ?? []
}
```

### 



找出前k个最小的数同理，

创建一个大顶堆 小于堆顶的元素replace