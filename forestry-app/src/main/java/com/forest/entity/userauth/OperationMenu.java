package com.forest.entity.userauth;

import java.util.ArrayList;
import java.util.List;

public class OperationMenu {
	
	private int id;
	private String text;
	private String url;
	private String description;
	private int parentId;
	private int menuSort;
	
	private String parentName;
	
	private List<OperationMenu> children = new ArrayList<OperationMenu>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public int getMenuSort() {
		return menuSort;
	}

	public void setMenuSort(int menuSort) {
		this.menuSort = menuSort;
	}

	public List<OperationMenu> getChildren() {
		return children;
	}

	public void setChildren(List<OperationMenu> children) {
		this.children = children;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	
}
