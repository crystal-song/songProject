package com.mftour.spring.constants.enums;

public enum CityEnum {
    BEIJING("BJ"), //
    ;
    private String value;

    private CityEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
