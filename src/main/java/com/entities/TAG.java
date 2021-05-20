package com.entities;

public enum TAG{
	
	IMPORTANT(3),URGENT(2),INFO(1);
	
	private final int value;
    private TAG(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
