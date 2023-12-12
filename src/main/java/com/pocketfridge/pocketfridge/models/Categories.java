package com.pocketfridge.pocketfridge.models;

public class Categories {
    private int id;
    private String name;
    private String createDate;
    private String storeFeatures;

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

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getStoreFeatures() {
        return storeFeatures;
    }

    public void setStoreFeatures(String storeFeatures) {
        this.storeFeatures = storeFeatures;
    }

    @Override
    public String toString() {
        return "Categories{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", createDate='" + createDate + '\'' +
                ", storeFeatures='" + storeFeatures + '\'' +
                '}';
    }
}
