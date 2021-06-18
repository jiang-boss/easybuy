package com.jiang.pojo;

import org.omg.PortableInterceptor.INACTIVE;

import java.sql.Statement;
import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-26-0:14
 */
public class Page<T> {
    public static final Integer PAGE_SIZE=4;
    private Integer pageNum;//当前页码
    private Integer pageTotal;//总页码
    private Integer pageSize=PAGE_SIZE;
    private List<T> items;//每页显示的新闻
    private Integer pageTotalCount;//新闻的总数
    private String uri;
    public Page() {
    }
    public Page(Integer pageNum, Integer pageTotal, Integer pageSize, List<T> items, Integer pageTotalCount, String uri) {
        this.pageNum = pageNum;
        this.pageTotal = pageTotal;
        this.pageSize = pageSize;
        this.items = items;
        this.pageTotalCount = pageTotalCount;
        this.uri = uri;
    }
    public static Integer getPageSize() {
        return PAGE_SIZE;
    }
    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        if(pageNum<=1){
            pageNum=1;
        }else if (pageNum>pageTotal){
            pageNum=pageTotal;
        }
        this.pageNum=pageNum;
    }
    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNum=" + pageNum +
                ", pageTotal=" + pageTotal +
                ", pageSize=" + pageSize +
                ", items=" + items +
                ", pageTotalCount=" + pageTotalCount +
                ", uri='" + uri + '\'' +
                '}';
    }
}
