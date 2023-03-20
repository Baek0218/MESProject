package com.itwillbs.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.member.service.MemberService;


@Controller
public class MemberController {

	@Inject
	private MemberService memberService; // 4����.�ڵ����� ��ü���� �� ��.

	// �����ּ� http://localhost:8080/myweb/member/insert
	// �ڵ����� �����ּ� �̾ƿ� /member/insert
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		// �ּҺ��� ���� �̵�
		// /WEB-INF/views/member/insertForm.jsp
		return "member/insertForm";
	}

	// �����ּ� http://localhost:8080/myweb/member/insertPro
	// �ڵ����� �����ּ� �̾ƿ� /member/insertPro
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro()");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());


		// �޼��� ȣ��
		memberService.insertMember(memberDTO);

		// �ּ� ����Ǹ鼭 �α��� �������� �̵�
		// response.sendRedirect("/member/login");
		return "redirect:/member/login";
	}

	// �����ּ� http://localhost:8080/myweb/member/login
	// �ڵ����� �����ּ� �̾ƿ� /member/login
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		// �ּҺ��� ���� �̵�
		// /WEB-INF/views/member/loginForm.jsp
		return "member/loginForm";
	}

	// �����ּ� http://localhost:8080/myweb/member/loginPro
	// �ڵ����� �����ּ� �̾ƿ� /member/loginPro
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		// ��� �α��� ó�� => ó�� => ��� �ڹ� �޼��� ȣ��
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);

		if (memberDTO2 != null) {
			// ���̵�,��й�ȣ ��ġ
			System.out.println("memberController.loginPro.���̵� ��й�ȣ ��ġ");
			session.setAttribute("id", memberDTO.getId());
			// �ּ� ����Ǹ鼭 ������������ �̵�
			return "redirect:/member/main";
		} else {
			// ���̵�,��й�ȣ Ʋ��
			System.out.println("memberController.loginPro.���̵� ��й�ȣ Ʋ��");
			// member/msg.jsp ���� "���̵� ��й�ȣ Ʋ��" �޽��� ����ϰ� �ڷ��̵�
			return "member/msg";
		}
		// �ּ� ����Ǹ鼭 �α��� �������� �̵�
		// response.sendRedirect("/member/main");
	}

	// �����ּ� http://localhost:8080/myweb/member/main
	// �ڵ����� �����ּ� �̾ƿ� /member/main
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		// �ּҺ��� ���� �̵�
		// /WEB-INF/views/member/main.jsp
		return "member/main";
	}

	// �����ּ� http://localhost:8080/myweb/member/logout
	// �ڵ����� �����ּ� �̾ƿ� /member/logout
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// �� �ڵ����� http���� ��ü ����.
		System.out.println("MemberController logout()");
		// ���� �ʱ�ȭ
		session.invalidate();
		// �ּ� ����Ǹ鼭 �α��� �������� �̵�
		// response.sendRedirect("/member/main");
		return "redirect:/member/main";
	}

	// �����ּ� http://localhost:8080/myweb/member/info?id=kim
	// �ڵ����� �����ּ� �̾ƿ� /member/info
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) {
		System.out.println("MemberController info()");
		// ���ǰ� ��������
		String id = (String) session.getAttribute("id");
		System.out.println("MemberController.info ���� id : " + id);
		MemberDTO memberDTO = memberService.getMember(id);

		// memberDTO ���� ��� member/info.jsp�� �̵�
		// request.setAttribute("memberDTO",memberDTO);
		// -> request ��ſ� ���������� Model ��Ƽ� �̵�
		// -> ������������ �̷��� ����Ѵ� -> model.addAttribute(�̸�,��)
		model.addAttribute("memberDTO", memberDTO);

		// �ּҺ��� ���� �̵�
		// /WEB-INF/views/member/info.jsp
		return "member/info"; // ������ ���� ���� ��ȸ
	}

	// �����ּ� http://localhost:8080/myweb/member/update
	// �ڵ����� �����ּ� �̾ƿ� /member/update
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) { // ������ ��Ƽ� �����°� �ƴϰ� ���ǰ��� �θ��ű⶧���� ������ ������ �ش�.
		System.out.println("MemberController update()");
		// ���ǰ� ��������
		String id = (String) session.getAttribute("id");
		System.out.println("MemberController.updatePro ���� id : " + id);

		MemberDTO memberDTO = memberService.getMember(id);

		model.addAttribute("memberDTO", memberDTO);

		// �ּҺ��� ���� �̵�
		// /WEB-INF/views/member/updateForm.jsp
		return "member/updateForm";
	}

	// �����ּ� http://localhost:8080/myweb/member/updatePro
	// �ڵ����� �����ּ� �̾ƿ� /member/updatePro
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro()");
		
		// ��� ���� ó�� => ó�� => ��� �ڹ� �޼��� ȣ��
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());
		
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);

		if (memberDTO2 != null) {
			// ���̵�,��й�ȣ ��ġ
			System.out.println("memberController.updatePro.���̵� ��й�ȣ ��ġ");

			// �����۾�
			memberService.updateMember(memberDTO);
			// �ּ� ����Ǹ鼭 ������������ �̵�
			return "redirect:/member/main";
		} else {
			// ���̵�,��й�ȣ Ʋ��
			System.out.println("memberController.updatePro.���̵� ��й�ȣ Ʋ��");
			// member/msg.jsp ���� "���̵� ��й�ȣ Ʋ��" �޽��� ����ϰ� �ڷ��̵�
			return "member/msg";
		}
		// �ּ� ����Ǹ鼭 ���� �������� �̵�
		// response.sendRedirect("/member/main");
	}

	// �����ּ� http://localhost:8080/myweb/member/delete
	// �ڵ����� �����ּ� �̾ƿ� /member/delete
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model model) {
		System.out.println("MemberController delete()");
		// ���ǰ� ��������
		String id = (String) session.getAttribute("id");
		System.out.println("MemberController.delete ���� id : " + id);

		MemberDTO memberDTO = memberService.getMember(id);

		model.addAttribute("memberDTO", memberDTO);

		// �ּҺ��� ���� �̵�
		// /WEB-INF/views/member/deleteForm.jsp
		return "member/deleteForm";
	}

	// �����ּ� http://localhost:8080/myweb/member/deletePro
	// �ڵ����� �����ּ� �̾ƿ� /member/deletePro
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO memberDTO,HttpSession session) {
		System.out.println("MemberController deletePro()");
		// ��� ���� ó�� => ó�� => ��� �ڹ� �޼��� ȣ��
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		// System.out.println(memberDTO.getName());

		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);

		if (memberDTO2 != null) {
			// ���̵�,��й�ȣ ��ġ
			System.out.println("memberController.deletePro.���̵� ��й�ȣ ��ġ");

			// ��ġ�ϸ� �����۾�
			memberService.deleteMember(memberDTO);
			
			// ���� �ʱ�ȭ
			session.invalidate();
			
			// �ּ� ����Ǹ鼭 ������������ �̵�
			return "redirect:/member/main";
			
		} else {
			// ���̵�,��й�ȣ Ʋ��
			System.out.println("memberController.delete.���̵� ��й�ȣ Ʋ��");
			// member/msg.jsp ���� "���̵� ��й�ȣ Ʋ��" �޽��� ����ϰ� �ڷ��̵�
			return "member/msg";
		}
	}

	// �����ּ� http://localhost:8080/myweb/member/list
	// �ڵ����� �����ּ� �̾ƿ� /member/list
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		List<MemberDTO> memberList = memberService.getMemberList();
		
		model.addAttribute("memberList", memberList);
		
		
		// �ּҺ��� ���� �̵�
		// /WEB-INF/views/member/list.jsp
		return "member/list";
	}

}
