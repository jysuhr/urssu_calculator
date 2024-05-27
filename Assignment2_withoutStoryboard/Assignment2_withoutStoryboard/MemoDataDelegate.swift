//
//  MemoDataDelegate.swift
//  Assignment2_withoutStoryboard
//
//  Created by 서준영 on 5/26/24.
//
import UIKit

// 변수를 전달할 때
protocol MemoDataDelegate: AnyObject {
    func memoDataUpdated(title: String?, content: String?)
}
