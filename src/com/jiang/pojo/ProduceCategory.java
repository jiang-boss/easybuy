package com.jiang.pojo;

/**
 * @author jiangboss
 * @create 2021-05-24-11:38
 */
public class ProduceCategory {
    private Integer id;//主键
    private String name;//名称
    private Integer parentId;//父级目录
    private  Integer type;//级别
    private String iconClass;//图标
    public ProduceCategory() {
    }

    public ProduceCategory(Integer id, String name, Integer parentId,
                           Integer type, String iconClass) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.type = type;
        this.iconClass = iconClass;
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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getIconClass() {
        return iconClass;
    }

    public void setIconClass(String iconClass) {
        this.iconClass = iconClass;
    }
    @Override
    public String toString() {
        return "ProduceCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", type=" + type +
                ", iconClass='" + iconClass + '\'' +
                '}';
    }
}
