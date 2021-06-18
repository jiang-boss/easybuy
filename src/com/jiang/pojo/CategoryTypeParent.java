package com.jiang.pojo;

/**
 * @author jiangboss
 * @create 2021-05-31-1:09
 */
public class CategoryTypeParent {
    private Integer id;
    private String name;
    private String parentName;
    private Integer parentId;
    private Integer parenrIdPro;

    public CategoryTypeParent() {
    }

    public CategoryTypeParent(Integer id, String name, String parentName, Integer parentId, Integer parenrIdPro) {
        this.id = id;
        this.name = name;
        this.parentName = parentName;
        this.parentId = parentId;
        this.parenrIdPro = parenrIdPro;
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

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getParenrIdPro() {
        return parenrIdPro;
    }

    public void setParenrIdPro(Integer parenrIdPro) {
        this.parenrIdPro = parenrIdPro;
    }

    @Override
    public String toString() {
        return "CategoryTypeParent{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentName='" + parentName + '\'' +
                ", parentId=" + parentId +
                ", parenrIdPro=" + parenrIdPro +
                '}';
    }
}
