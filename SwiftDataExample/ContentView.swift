//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Gokul Nair on 06/06/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Products.name, order: .forward, animation: .spring)
    var products:[Products]
    
    @State private var showAlert = false
    @State private var updatedProductName = ""
    @State private var isUpdate: Bool = false
    @State private var selectedProduct: Products?
    
    var body: some View {
        NavigationStack {
            List(products) { product in
                Text(product.name)
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(product)
                        }
                        
                        Button("Update", role: .none) {
                            isUpdate = true
                            selectedProduct = product
                            withAnimation {
                                showAlert.toggle()
                            }
                        }
                    }
            }.toolbar {
                Button {
                    isUpdate = false
                    withAnimation {
                        showAlert.toggle()
                    }
                }label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                }
            }
            .navigationTitle(Text("WWDC Bucket"))
        }.alert(isUpdate ? "Update" : "Add", isPresented: $showAlert) {
            TextField("Enter name", text: $updatedProductName)
            
            Button("Save") {
                if !isUpdate {
                    addProduct()
                }else {
                    updateProduct()
                }
            }
            Button("Cancel", role: .cancel, action: {})
        }
    }
    
    private func addProduct() {
        let product = Products(name: updatedProductName)
        modelContext.insert(product)
        updatedProductName = ""
    }
    
    private func updateProduct() {
        selectedProduct?.name = updatedProductName
        updatedProductName = ""
    }
}

#Preview {
    ContentView()
}
