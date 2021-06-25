package com.jiang.service.Impl;

import com.jiang.dao.Impl.ProductDaoImpl;
import com.jiang.dao.ProductDao;
import com.jiang.pojo.Page;
import com.jiang.pojo.Product;
import com.jiang.service.ProductService;
import sun.util.resources.cldr.ps.CurrencyNames_ps;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author jiangboss
 * @create 2021-05-27-9:45
 */
public class ProductServiceImpl implements ProductService {
    ProductDao productDao=new ProductDaoImpl();
    @Override
    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    @Override
    public void deleteProductById(Integer id) {
        productDao.deleteProduct(id);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product);

    }

    @Override
    public Product findProductById(Integer id) {
        return productDao.queryProductById(id);
    }

    @Override
    public List<Product> findProductList() {
        return productDao.queryProductList();
    }

    @Override
    public Page<Product> findProductPage(int pageNum, int pageSize) {
        Page<Product> page=new Page<>();
        page.setPageSize(pageSize);//设置每页显示的大小

        Integer pageTotalCount = productDao.queryProductCount();//获取当前的总数据的条数
        page.setPageTotalCount(pageTotalCount);
         //求出总页码
         Integer pageTotal=pageTotalCount/Page.PAGE_SIZE;
         if(pageTotalCount%Page.PAGE_SIZE>0){
             pageTotal+=1;
         }
         //设置总页码
         page.setPageTotal(pageTotal);
        page.setPageNum(pageNum);//设置当前页码
         //设置当前的页面的索引
        int begin=(page.getPageNum()-1)*pageSize;
        List<Product> products = productDao.queryForPageProduct(begin, pageSize);
        page.setItems(products);
        return  page;
    }

    /**
     *
     * @param id 商品的三级id
     * @return  返回三级id下的所有商品
     */
    @Override
    public Page<Product> findProductPageByLevel3Id(int pageNum,int pageSize,int id) {
        Page<Product> page=new Page<>();
        page.setPageSize(pageSize);//设置每页显示的大小
        //得到当前分类下的商品总数
        Integer pageTotalCount = productDao.queryProductCountById3(id);//获取当前的总数据的条数
        page.setPageTotalCount(pageTotalCount);
        //求出总页码
        Integer pageTotal=pageTotalCount/Page.PAGE_SIZE;
        if(pageTotalCount%Page.PAGE_SIZE>0){
            pageTotal+=1;
        }
        //设置总页码
        page.setPageTotal(pageTotal);
        page.setPageNum(pageNum);//设置当前页码
        //设置当前的页面的索引
        Integer begin=(page.getPageNum()-1)*pageSize;
        List<Product> products = productDao.queryForProductById3(begin,pageSize,id);
        page.setItems(products);
        return page;
    }

    @Override
    public Page<Product> findProductPageByLike(int pageNum, int pageSize, String likePro) {

        Page<Product> page=new Page<>();
        page.setPageSize(pageSize);//设置每页显示的大小
        //得到当前分类下的商品总数
        String sl="%"+likePro+"%";
        Integer pageTotalCount = productDao.queryProductCountById3Like(sl);//获取当前的总数据的条数
        page.setPageTotalCount(pageTotalCount);
        //求出总页码
        Integer pageTotal=pageTotalCount/Page.PAGE_SIZE;
        if(pageTotalCount%Page.PAGE_SIZE>0){
            pageTotal+=1;
        }
        //设置总页码
        page.setPageTotal(pageTotal);
        page.setPageNum(pageNum);//设置当前页码
        //设置当前的页面的索引
        Integer begin=(page.getPageNum()-1)*pageSize;
        List<Product> products = productDao.queryForProductById3Like(begin,pageSize,sl);
        page.setItems(products);
        return page;
    }

//    /**
//     * 这里将商品的每个一级分类分开的得到下面的产品
//     * @return
//     */
//    @Override
//    public Map<Integer, List<Product>> findProductFloor() {
//        Map<Integer,List<Product>> productFloor=new HashMap<>();
//        List<Product> products = productDao.queryProductList();//这里得到所有的商品
//
//        return  null;
//    }


}
