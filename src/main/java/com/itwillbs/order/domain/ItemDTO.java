package com.itwillbs.order.domain;

public class ItemDTO {
	private String itemNum;		// ��踰�
	private String itemName;	// ��紐�
	private String invntUnit;
	
	public String getInvntUnit() {
		return invntUnit;
	}
	public void setInvntUnit(String invntUnit) {
		this.invntUnit = invntUnit;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	@Override
	public String toString() {
		return "itemDTO [itemNum=" + itemNum + ", itemName=" + itemName + ",invntUnit=" + invntUnit + "]";
	}
	
}
