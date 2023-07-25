//
//  InstaSegmentEnum.swift
//  UIComponets
//
//  Created by Rajan Patel on 03/06/23.
//

import UIKit

enum InstaSegment: Int {
    case posts, reels, tagPosts
    
    func getCount() -> Int {
        switch self {
        case .posts: return InstaStory.uploadedPost.count + InstaStory.reels.count + InstaStory.tagedPosts.count
        case .reels: return InstaStory.reels.count
        case .tagPosts: return InstaStory.tagedPosts.count
        }
    }
    
    func getImage(index: Int) -> UIImage? {
        switch self {
        case .posts:
            let posts = InstaStory.uploadedPost + InstaStory.reels + InstaStory.tagedPosts
            return posts[index]
        case .reels: return InstaStory.reels[index]
        case .tagPosts: return InstaStory.tagedPosts[index]
        }
    }
    
}
