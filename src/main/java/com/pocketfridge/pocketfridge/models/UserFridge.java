package com.pocketfridge.pocketfridge.models;

public class UserFridge {
    private int id;
    private int productId;
    private int quantity;
    private String additionDate;
    private String expirationDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAdditionDate() {
        return additionDate;
    }

    public void setAdditionDate(String additionDate) {
        this.additionDate = additionDate;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    @Override
    public String toString() {
        return "UserFridge{" +
                "id=" + id +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", additionDate='" + additionDate + '\'' +
                ", expirationDate='" + expirationDate + '\'' +
                '}';
    }
}
