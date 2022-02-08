//
//  SampleFile.swift
//  GuessFlag
//
//  Created by Shreemit on 08/02/22.
//

import SwiftUI

struct SampleFile: View {
	@State private var showingAlert = false
	var body: some View {
		VStack {
			Spacer()
			ZStack {
				VStack(spacing: 0) {
					Color.blue
					Color.yellow
				}.overlay(LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .white, location: 0.25),.init(color: .blue, location: 0.76)]), startPoint: .top, endPoint: .bottom))
				Text("Content")
					.foregroundColor(.secondary)
					.padding(50).background(.ultraThinMaterial)
			}
			Spacer()
			Button("Showing Alert") {
				showingAlert = true
			}.alert("Important Message", isPresented: $showingAlert) {
				Button("Ok",role: .cancel) { }
				Button("Cancel",role: .destructive) { }
			} message: {
				Text("Read this msg")
			}
		}
	}
}

struct SampleFile_Previews: PreviewProvider {
    static var previews: some View {
        SampleFile()
    }
}
