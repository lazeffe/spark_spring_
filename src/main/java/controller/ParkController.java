package controller;

import model.bookmark.BookmarkDao;
import model.bookmark.BookmarkDto;
import model.park.ParkDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.park.Park;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ParkController {

  private Park park;
  private BookmarkDao bookmarkDao;

  @Autowired
  public ParkController(Park park, BookmarkDao bookmarkDao) {
    this.park = park;
    this.bookmarkDao = bookmarkDao;
  }

  @RequestMapping("/parkSearch.pa")
  protected ModelAndView parkSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
    String parking_name = request.getParameter("PARKING_NAME");

    request.setAttribute("parking_name", parking_name);

    /* get bmk list*/
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");
    Map<String, Object> model = new HashMap<String, Object>();
    List<BookmarkDto> bmkList = null;

    bmkList = bookmarkDao.getBmkList(email);

    model.put("bookmarkList", bmkList);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("park_search");
    mav.addAllObjects(model);

    return mav;
  }

  @RequestMapping("/parkDetail.pa")
  public ModelAndView parkDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
    String parking_name = request.getParameter("PARKING_NAME");

    ParkDto parkDto = park.getParkDetail(parking_name);

    Map<String, Object> model = new HashMap<String, Object>();
    model.put("parkInfo", parkDto);

    /* get bmk list*/
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");
    List<BookmarkDto> bmkList = null;

    bmkList = bookmarkDao.getBmkList(email);

    model.put("bookmarkList", bmkList);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("park_detail");
    mav.addAllObjects(model);

    return mav;
  }

}
