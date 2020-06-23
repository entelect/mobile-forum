//
//  SwipeActionBar.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct SwipeActionBar: View {
    let likeAction: () -> ()
    let superLikeAction: () -> ()
    let rejectAction: () -> ()
    var status: UserStatus
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                self.likeAction()
            }) {
                VStack {
                    Image(systemName: "hand.thumbsup")
                        .imageScale(.large)
                        .frame(maxWidth: 50, maxHeight: 50)
                        .accentColor(self.status == .like ? .red : .white)
                    Text("Like")
                        .foregroundColor(self.status == .like ? .red : .white)
                }
            }
            
            Spacer()
            
            Button(action: {
                self.superLikeAction()
            }) {
                VStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .frame(maxWidth: 50, maxHeight: 50)
                        .imageScale(.large)
                        .accentColor(self.status == .superLike ? .red : .white)
                    Text("Super Like")
                        .foregroundColor(self.status == .superLike ? .red : .white)
                }
            }
            
            Spacer()
            
            Button(action: {
                self.rejectAction()
            }) {
                VStack {
                    Image(systemName: "hand.thumbsdown")
                        .frame(maxWidth: 50, maxHeight: 50)
                        .imageScale(.large)
                        .accentColor(self.status == .reject ? .red : .white)
                    Text("Reject")
                        .foregroundColor(self.status == .reject ? .red : .white)
                }
            }
            
            Spacer()
        }
    }
}

struct SwipeActionBar_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionBar(likeAction: {}, superLikeAction: {}, rejectAction: {}, status: .like)
    }
}
