package controller;

import model.MemberDao;
import model.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MemberController {

  private Member member;
  private MemberDao memberDao;
  private MemberDto memberDto;

  @Autowired
  public MemberController(Member member, MemberDao memberDao, MemberDto memberDto) {
    this.member = member;
    this.memberDao = memberDao;
    this.memberDto = memberDto;
  }

  @RequestMapping("/signIn.lo")
  protected String signIn() {

    return "signIn";
  }

  @RequestMapping("/signUp.lo")
  protected String signUp() {

    return "signUp";
  }

  @RequestMapping("/memberLoginAction.lo")
  protected String signInAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

    String email = request.getParameter("email");
    String pw = request.getParameter("pw");

    boolean result = member.getMemberCheck(request, response, email, pw);

    if (result) {
      return "home";
    } else {
      return null;
    }

  }

  @RequestMapping("/memberLogoutAction.lo")
  protected String logOutAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

    HttpSession session = request.getSession();

    session.invalidate();

    return "home";

  }

  @RequestMapping("/memberJoinAction.lo")
  protected String memberJoinAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

    String email = request.getParameter("email");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");

    memberDao.memberInsert(email, pw, name, age, gender);

    return "home";

  }

  @RequestMapping("/memberViewAction.lo")
  public ModelAndView memberViewAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");

    memberDto = memberDao.getDetail(email);

    Map<String, Object> model = new HashMap<String, Object>();
    model.put("userInfo", memberDto);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("account");
    mav.addAllObjects(model);

    return mav;
  }

  /*@RequestMapping("/memberModifyAction.lo")
  protected String memberModifyAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    boolean result = false;

    HttpSession session = request.getSession();

    String email = (String) session.getAttribute("email");
    String old_pw = request.getParameter("old_pw");
    String new_pw = request.getParameter("new_pw");

    memberDto = memberDao.getDetail(email);

    System.out.println(memberDto.getPassword());

    if (old_pw.equals(memberDto.getPassword())) {

      memberDao.memberModify(email, new_pw);

    } else {
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      out.println("<script>");
      out.println("alert('비밀번호가 일치하지 않습니다.')");
      out.println("location.href='/views/modifyPW.jsp'");
      out.println("</script>");
      out.close();
      return null;
    }

    return "redirect:memberViewAction.lo";
  }*/

}
