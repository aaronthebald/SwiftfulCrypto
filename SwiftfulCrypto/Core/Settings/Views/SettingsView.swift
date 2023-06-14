//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by Aaron Wilson on 3/7/23.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/aaronthebald")!
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                // background
                Color.theme.background.ignoresSafeArea()
                
                // content
                List {
                    swiftfulThinkingSection
                    coinGeckoSection
                    developerSection
                    applicationSection
                }
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swiftful Thinking"))  {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a youtube playlist.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Youtube!", destination: youtubeURL)
            Link("Support his coffee addiction ☕️", destination: coffeeURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko"))  {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The Crypto data is from a free API provided by CoinGecko. (Data may be slightly off)")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
        }
    }

    private var developerSection: some View {
        Section(header: Text("Developer"))  {
            VStack(alignment: .leading) {
                Image("me")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed in 14 days. I have made a ton of progress and im ready to keep going.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Check out my GitHub", destination: personalURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application"))  {
            
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }

}
