
package com.tap.model;

import java.util.HashMap;

import java.util.Map;


public class Cart {
   
    private Map<Integer, CartItem> items;
    
   
    public Cart() {
        this.items = new HashMap<>();
    }
    
    // Method to add a new item to the cart or update the quantity if the item already exists
    public void addItem(CartItem newItem) {
        int itemId = newItem.getItemId();
        if (items.containsKey(itemId)) {
            CartItem oldItem = items.get(itemId); 
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity()); 
        } else {
            items.put(itemId, newItem); 
        }
    }
    
    // Method to update the quantity of an item in the cart
    public void updateItem(int itemId, int quantity) { 
        if (items.containsKey(itemId)) {
            if (quantity <= 0) { // If the quantity is less than or equal to zero
                items.remove(itemId); 
            } else { 
                items.get(itemId).setQuantity(quantity); // Update the quantity of the item
            }
        }
    }
    
    // Method to remove an item from the cart
    public void removeItem(int itemId) {
        items.remove(itemId); // Remove the item from the cart
    }
    
    // Getter method to retrieve all items in the cart
    public Map<Integer, CartItem> getItems() {
        return items; // Return the map of cart items
    }
    
    // Method to clear all items from the cart
    public void clear() {
        items.clear(); // Remove all items from the cart
    }
}