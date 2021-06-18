package com.jiang.pojo;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-31-10:06
 * 树节点
 */
public class TreeObject {
    private Integer id;
    private String name;
    private Integer parentId;
    List<TreeObject> childList;

    public TreeObject() {
    }

    public TreeObject(Integer id, String name, Integer parentId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public List<TreeObject> getChild() {
        return childList;
    }

    public void setChild(List<TreeObject> childList) {
        this.childList = childList;
    }

    @Override
    public String toString() {
        return "TreeObject{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", childList=" + childList +
                '}';
    }
}
