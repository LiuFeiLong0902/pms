package com.sram.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.PostGo;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class PostGoAction extends BaseAction{
	
	private static List<String> bList=new ArrayList<String>();
	private PostGoAction(){
		 
	}
	public static PostGoAction getBList(){
		
		return (PostGoAction) bList;
		
	}
	String box;
	public String getBox() {
		return box;
	}
	public void setBox(String box) {
		this.box = box;
	}
	private PostGo postGo;
	public PostGo getPostGo() {
		return postGo;
	}
	public void setPostGo(PostGo postGo) {
		this.postGo = postGo;
	}
	
	public String post() throws Exception {
		postGoService.add(postGo);

		return checkList();
	}

	public String checkList(){
		List<PostGo> plist=postGoService.list();
		ActionContext.getContext().put("plist", plist);
		return "list";
		
	}
	public String checkList2(){
		List<PostGo> plist=postGoService.list();
		ActionContext.getContext().put("plist", plist);
		return "list2";
		
	}
	public String checkone(){
		
		int id=Integer.parseInt((ServletActionContext.getRequest().getParameter("id")));
		PostGo onelist=postGoService.getById(id);
		ActionContext.getContext().put("onelist", onelist);
		return "checkone";	
	}
	public String checkone_one(){
		
		int id=Integer.parseInt((ServletActionContext.getRequest().getParameter("id")));
		PostGo onelist=postGoService.getById(id);
		ActionContext.getContext().put("onelist", onelist);
		return "checkone_one";	
	}
	public String post_update(){
		postGoService.update(postGo);
			
		return checkList();
		
	}
	public String post_delete_one(){
		int id=Integer.parseInt((ServletActionContext.getRequest().getParameter("id")));
		postGoService.delete(id);
		return checkList();
		
	}
	public String checkConditions(){
		String name=postGo.getName();
		String position=postGo.getPosition();
		List<PostGo> plist=postGoService.getByConditions(name, position);
		ActionContext.getContext().put("plist", plist);
		return "checkConditions";
		
	}
	public String checkConditions2(){
		String name=postGo.getName();
		String position=postGo.getPosition();
		List<PostGo> plist=postGoService.getByConditions(name, position);
		ActionContext.getContext().put("plist", plist);
		return "checkConditions2";
		
	}
	
	public String boxList(){
		System.out.println("++++++++++++++++++++"+box);
			
			if(bList.contains(box)){
			bList.remove(box);
			}else{
			bList.add(box);	
			}
			System.out.println("-------------------"+bList);
			ActionContext.getContext().put("bList", bList);
		return null;
		
	}
	
	public String delSome(){
			System.out.println("---++++++++++----"+bList);
			for(int i=0;i<bList.size();i++){		
				postGoService.delete(Integer.parseInt(bList.get(i)));	
			}
			bList=new ArrayList<String>();
			System.out.println("---after.....----"+bList);

		return checkList();
	}

}
