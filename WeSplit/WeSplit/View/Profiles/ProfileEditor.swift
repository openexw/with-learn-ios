//
//  ProfileEditor.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/10.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile:Profile
    
    var dateRange: ClosedRange<Date> {
           let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
           let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
           return min...max
       }
    
    var body: some View {
        List {
            HStack(content: {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            })
            
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications")
            }
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
               ForEach(Profile.Season.allCases) { season in
                   Text(season.rawValue).tag(season)
               }
           }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
            
            Form {
                Section {
                    Text("Hello, world!")
                }

                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
