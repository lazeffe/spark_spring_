package controller;

import model.bookmark.BookmarkDao;
import model.bookmark.BookmarkDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import service.member.Member;
import model.member.MemberDao;
import model.member.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes({"email", "username"})
public class MemberController {

  private Member member;
  private MemberDao memberDao;
  private BookmarkDao bookmarkDao;

  @Autowired
  public MemberController(Member member, MemberDao memberDao, BookmarkDao bookmarkDao) {
    this.member = member;
    this.memberDao = memberDao;
    this.bookmarkDao = bookmarkDao;
  }

  @RequestMapping("/signIn.me")
  protected String signIn() {

    return "signIn";
  }

  @RequestMapping("/signUp.me")
  protected String signUp() {

    return "signUp";
  }

  @RequestMapping("/memberLoginAction.me")
  protected ModelAndView signInAction(Model modelForSession ,HttpServletRequest request, HttpServletResponse response) throws Exception {

    String email = request.getParameter("email");
    String pw = request.getParameter("pw");

    boolean result = member.getMemberCheck(request, response, email, pw);

    MemberDto memberDto = memberDao.getDetail(email);

    if (result) {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("username", memberDto.getName());

      List<BookmarkDto> bmkList = null;

      bmkList = bookmarkDao.getBmkList(email);

      model.put("bookmarkList", bmkList);

      ModelAndView mav = new ModelAndView();
      mav.setViewName("home");
      mav.addAllObjects(model);

      return mav;

    } else {
      return null;
    }

  }

  @RequestMapping("/memberLogoutAction.me")
  protected String logOutAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

    HttpSession session = request.getSession();

    session.invalidate();

    return "home";

  }

  @RequestMapping("/memberJoinAction.me")
  protected String memberJoinAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

    String email = request.getParameter("email");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");

    memberDao.memberInsert(email, pw, name, age, gender);

    return "home";

  }

  @RequestMapping("/memberViewAction.me")
  public ModelAndView memberViewAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");

    MemberDto memberDto = memberDao.getDetail(email);

    Map<String, Object> model = new HashMap<String, Object>();
    model.put("userInfo", memberDto);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("account");
    mav.addAllObjects(model);

    return mav;
  }

  @RequestMapping("/memberModifyAction.me")
  protected void memberModifyAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

    PrintWriter out = response.getWriter();

    String email = request.getParameter("email");
    String old_pw = request.getParameter("old_pw");
    String new_pw = request.getParameter("new_pw");

    MemberDto memberDto = memberDao.getDetail(email);

    if (memberDto.getPassword().equals(old_pw)) {
      memberDao.modifyPW(email, new_pw);
      out.print("success");
    } else {
      out.print("fail");
    }
  }

  @RequestMapping("/memberDeleteAction.me")
  protected void memberDeleteAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

    HttpSession session = request.getSession();
    PrintWriter out = response.getWriter();

    String email = request.getParameter("email");
    String pw = request.getParameter("pw");

    System.out.println(email);
    System.out.println(pw);

    MemberDto memberDto = memberDao.getDetail(email);

    if (memberDto.getPassword().equals(pw)) {
      memberDao.deleteAcc(email);
      session.invalidate();
      out.print("success");
    } else {
      out.print("fail");
    }
  }

}
