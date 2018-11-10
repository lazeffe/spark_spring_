package controller;

import model.bookmark.BookmarkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.bookmark.Bookmark;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
public class BookmarkController {

  private Bookmark bookmark;
  private BookmarkDao bookmarkDao;

  @Autowired
  public BookmarkController(Bookmark bookmark, BookmarkDao bookmarkDao) {
    this.bookmark = bookmark;
    this.bookmarkDao = bookmarkDao;
  }

  @RequestMapping("/addBmk.bo")
  protected void addBmk(HttpServletRequest request, HttpServletResponse response) throws Exception {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");
    String code = request.getParameter("PARKING_CODE");
    String name = request.getParameter("PARKING_NAME");

    int result1 = bookmark.getBmkChk(request, response, email, name);
  }

  @RequestMapping("/deleteBmk.bo")
  protected void DeleteBmk(HttpServletRequest request, HttpServletResponse response) throws Exception {
    PrintWriter out = response.getWriter();

    String email = request.getParameter("email");
    String bmkName = request.getParameter("bmkName");

    bookmarkDao.deleteBmk(email, bmkName);

    out.print("success");

  }

}
