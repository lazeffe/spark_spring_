package controller;

import model.bookmark.BookmarkDao;
import model.bookmark.BookmarkDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

  private BookmarkDao bookmarkDao;

  @Autowired
  public HomeController(BookmarkDao bookmarkDao) {
    this.bookmarkDao = bookmarkDao;
  }

  @RequestMapping("/home.ho")
  protected ModelAndView home(HttpServletRequest request, HttpServletResponse response) throws Exception {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");
    List<BookmarkDto> bmkList = null;

    bmkList = bookmarkDao.getBmkList(email);

    Map<String, Object> model = new HashMap<String, Object>();
    model.put("bookmarkList", bmkList);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("home");
    mav.addAllObjects(model);

    return mav;
  }

}


