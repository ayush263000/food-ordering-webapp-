package com.foodie.model;

public class FoodItem {
    private int id;
    private String name;
    private double price;
    private String restaurantName;
    private String type;
    private float rating;
    // Getters and Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getType() { return type; }
	public void setType(String type) { this.type = type; }

	public float getRating() { return rating; }
	public void setRating(float rating) { this.rating = rating; }
}
