//
//  Trie.swift
//  算法
//
//  Created by DianLee on 2021/8/4.
//

import Cocoa
class Trie {

    /** Initialize your data structure here. */
    var root = [String:Any?]()
    var end_of_word = "#"
    
    init() {
        root = trieNode()

    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root
        for (_, char) in word.enumerated() {
            let key: String = String(char)
            if let sunNode = node[key] as? [String : Any?]{
                node[key] = sunNode
            }else{
                node[key] = [String : Any?]()
            }
            node = node[key] as! [String : Any?]
//            root[key] = node
        }
        node[end_of_word] = end_of_word
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node:[String:Any?] = root
        for (_, char) in word.enumerated() {
            if node.keys.contains(String(char)) == false {
                return false
            }
            let key: String = String(char)
            if let sunNode = node[key]{
                node = sunNode as? [String : Any?] ?? [String : Any?]()
            }
        }
        return node.keys.contains(end_of_word)
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node:[String:Any?] = root
        for (_, char) in prefix.enumerated() {
            if node.keys.contains(String(char)) == false {
                return false
            }
            let key: String = String(char)
            if let sunNode = node[key]{
                node = sunNode as? [String : Any?] ?? [String : Any?]()
            }
        }
        return true
    }
}
