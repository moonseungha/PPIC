package com.ppicachu.ppic.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppicachu.ppic.chat.model.service.ChatService;
import com.ppicachu.ppic.chat.model.vo.Chat;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private MemberService mService;
	
	@ResponseBody
	@RequestMapping(value="updateConn.chat", produces="application/json; charset=UTF-8")
	public String ajaxUpdateConn(Member m, HttpSession session) {
		int result = cService.updateConn(m);
		
		if(result > 0) {
			Member updateUser = mService.loginMember(m);
		    session.setAttribute("loginUser", updateUser);
		    return new Gson().toJson(updateUser);
		} else {
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="memList.chat", produces="application/json; charset=UTF-8")
	public String ajaxSelectMemList(int userNo) {
		ArrayList<Member> list1 = cService.selectListMember(userNo);
		ArrayList<Department> list2 = mService.selectDeptList();
		HashMap<String, ArrayList> map = new HashMap<>();
		map.put("memList", list1);
		map.put("deptList", list2);
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping("likeMember.chat")
	public String ajaxLikeMember(Member m, String star) {
		int result = 0;
		if(star.equals("n")) {
			result = cService.insertChatLike(m);
		}else {
			result = cService.deleteChatLike(m);
		}
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="searchName.chat", produces="application/json; charset=UTF-8")
	public String ajaxSearchName(Member m) {
		ArrayList<Member> list = cService.searchName(m);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="chatRoomList.chat", produces="application/json; charset=UTF-8")
	public String ajaxChatRoomList(Chat c) {
		ArrayList<Chat> list = cService.selectChatRoomList(c);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value="searchChatRoom.chat", produces="application/json; charset=UTF-8")
	public String ajaxChatRoomSearch(Chat c) {
		ArrayList<Chat> list = cService.selectChatRoomList(c);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="createGroup.chat", produces="application/json; charset=UTF-8")
	public void ajaxCreateGroup(int userNo, @RequestParam(value="checkNo[]") ArrayList<Integer> checkNo) {
		checkNo.add(userNo);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("groupCount", checkNo.size());
		int result1 = cService.insertChatRoom(map);
		/* int result2 = cService.insertParticipant(checkNo); */
		
		System.out.println(result1);
		/* System.out.println(result2); */
	}
	
	@ResponseBody
	@RequestMapping(value="create.chat", produces="application/json; charset=UTF-8")
	public void ajaxCreateChat(int userNo, int clickNo) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("groupCount", 2);
		int result1 = cService.insertChatRoom(map);
		ArrayList<Integer> list1 = new ArrayList<>();
		list1.add(userNo);
		list1.add(clickNo);
		int result2 = cService.insertParticipant(list1);
		if(result1 > 0 && result2 > 0) {
			/* ArrayList<Chat> list2 = cService.selectChatList(); */
		}
	}
}
