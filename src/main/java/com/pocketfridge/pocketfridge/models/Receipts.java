package com.pocketfridge.pocketfridge.models;

public class Receipts {
    private int id;
    private String name;
    private String instruction;
    private String video;
    private int countryId;

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

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    @Override
    public String toString() {
        return "Receipts{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", instruction='" + instruction + '\'' +
                ", video='" + video + '\'' +
                ", countryId=" + countryId +
                '}';
    }
}
