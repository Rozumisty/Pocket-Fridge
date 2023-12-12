package com.pocketfridge.pocketfridge.models;

public class ReceiptsProducts {
    private int receiptId;
    private int productId;
    private String amount;

    public int getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(int receiptId) {
        this.receiptId = receiptId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "ReceiptsProducts{" +
                "receiptId=" + receiptId +
                ", productId=" + productId +
                ", amount='" + amount + '\'' +
                '}';
    }
}
