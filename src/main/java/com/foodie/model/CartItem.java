package com.foodie.model;

public class CartItem {
	private String itemName;
    private String price;
    private int quantity;

    public CartItem(String itemName, String price) {
        this.itemName = itemName;
        this.price = price;
        this.quantity = 1; // default quantity
    }

    public String getItemName() {
        return itemName;
    }
    
    public int getQuantity() {
    	return quantity;
    }
    
    public int incrementQuantity() {
    	return ++quantity;
    }
    
    public int decrementQuantity() {
    	return --quantity;
    }

    public String getPrice() {
        return price;
    }
}


//package com.foodie.model;
//
//public class CartItem {
//    private String name;
//    private String price;
//    private int quantity;
//
//    public CartItem() {}
//
//    public CartItem(String name, String price, int quantity) {
//        this.name = name;
//        this.price = price;
//        this.quantity = quantity;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getPrice() {
//        return price;
//    }
//
//    public void setPrice(String price) {
//        this.price = price;
//    }
//
//    public int getQuantity() {
//        return quantity;
//    }
//
//    public void setQuantity(int quantity) {
//        this.quantity = quantity;
//    }
//}
