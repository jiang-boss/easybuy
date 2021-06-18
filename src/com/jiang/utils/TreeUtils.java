package com.jiang.utils;

import com.jiang.pojo.TreeObject;
import org.junit.Test;

import java.util.*;

/**
 * @author jiangboss
 * @create 2021-05-31-9:20
 * 生成三极目录的树
 */
public class TreeUtils {
//    private List<TreeObject> rootList; //父类根节点的集合
//    private List<TreeObject> childList;//子节点的集合 二级和三级
//
//    /**
//     * 构造方法子类额父类的集合
//     * @param rootList
//     * @param childList
//     */
//    private TreeUtils(List<TreeObject> rootList, List<TreeObject> childList) {
//        this.rootList = rootList;
//        this.childList = childList;
//    }
//
//    /**
//     * 生成树结构
//     * @return
//     */
//   private List<TreeObject> getTree(){
//        if(childList!=null&&!childList.isEmpty()){
//            Map<Integer,Integer> childNodeListMap=new HashMap<>(childList.size());
//
//            //循环跟列表的的节点
//            rootList.forEach(treeObject->getChild(treeObject,childNodeListMap));
//            return rootList;
//        }
//        return null;
//    }
//
//    private void getChild(TreeObject treeObject,Map<Integer,Integer> childNodeListMap){
//        //创建一个list保存每个根节点中对应的节点
//        List<TreeObject> childList =new ArrayList<>();
//        childList.stream()
//                .filter(childNode->!childNodeListMap.containsKey(childNode.getId()))
//                .filter(childNode->childNode.getParentId().equals(treeObject.getId()))
//                .forEach(childNode->{
//                    childNodeListMap.put(childNode.getId(),childNode.getParentId());
//                    getChild(childNode,childNodeListMap);
//                    childList.add(childNode);
//                });
//        treeObject.setChildList(childList);
//    }



    private List<TreeObject> rootNodesList;//根节点列表

    private List<TreeObject> childNodesList;//身体节点列表

    public TreeUtils(){

    }
    public TreeUtils(List<TreeObject> rootNodesList, List<TreeObject> childNodesList) {
        this.rootNodesList = rootNodesList;
        this.childNodesList = childNodesList;
    }
    /**
     * 生成树状结构对象
     * @return
     */
    public List<TreeObject> getTreeObjectList() {
        //子节点列表不等于null或者个数不为空，将子节点封装到对应根节点
        if (childNodesList != null && !childNodesList.isEmpty()) {
            //创建一个map用于保存已经处理过的childNodesList中的TreeObject的id
            HashMap<Integer,Integer> childNodesHashMap = new HashMap<>(childNodesList.size());
            //循环根节点列表，将子节点列表封装到对应的根节点TreeObject对象中
            rootNodesList.forEach(rootNode -> getChild(rootNode, childNodesHashMap));
            return rootNodesList;
        }
        return null;
    }
    //将身体节点通过parentId识别封装到各自对应的父节点treeObject中
    private void getChild(TreeObject rootNode, Map<Integer, Integer> childNodesHashMap) {
        //创建一个list来保存每个根节点中对应的子节点
        List<TreeObject> childList = new ArrayList<>();
        childNodesList.stream()
                .filter(childNode -> !childNodesHashMap.containsKey(childNode.getId()))//过滤处理过的childNode
                .filter(childNode -> childNode.getParentId().equals(rootNode.getId()))//判断是否根节点的子节点
                .forEach(childNode -> {
                    childNodesHashMap.put(childNode.getId(), childNode.getParentId());//添加处理子节点信息
                    getChild(childNode, childNodesHashMap);//递归设置该子节点的子节点列表
                    childList.add(childNode);//添加该子节点到对应的根节点列表
                });
        rootNode.setChild(childList);
    }


    public static void main(String[] args) {
       TreeObject treeObject=new TreeObject(548,"化妆品",0);
//       treeObject.setId(548);
//       treeObject.setName("化妆品");
//       treeObject.setParentId(0);
       TreeObject treeObject1=new TreeObject();
       treeObject1.setId(654);
       treeObject1.setParentId(548);
       treeObject1.setName("面部护理");
       TreeObject treeObject2=new TreeObject();
       treeObject2.setName("少女派");
       treeObject2.setId(655);
       treeObject2.setParentId(654);

       List<TreeObject> list=new ArrayList<>();
       list.add(treeObject);
       List<TreeObject> list1=new ArrayList<>();
       list1.add(treeObject1);
       list1.add(treeObject2);
       TreeUtils treeUtils=new TreeUtils(list,list1);
        List<TreeObject> tree = treeUtils.getTreeObjectList();
        System.out.println(tree.get(0));
    }
}
