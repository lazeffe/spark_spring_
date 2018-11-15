package service.bookmark;

import model.bookmark.BookmarkDao;
import model.bookmark.BookmarkDto;
import model.park.ParkDao;
import model.park.ParkDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Service
public class BookmarkImpl implements Bookmark {

  private BookmarkDao bookmarkDao;
  private ParkDao parkDao;

  @Autowired
  public BookmarkImpl(BookmarkDao bookmarkDao, ParkDao parkDao) {
    this.bookmarkDao = bookmarkDao;
    this.parkDao = parkDao;
  }

  @Override
  public boolean getBmkChk(HttpServletRequest request, HttpServletResponse response, String email, String name) throws IOException {

    BookmarkDto result1 = bookmarkDao.bmkListChk(email, name);

    if (result1 != null) {
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = null;
      out = response.getWriter();
      out.println("<script>");
      out.println("alert('이미 즐겨찾기에 주가한 주차장입니다.')");
      out.println("location.href='/parkSearch.pa?PARKING_NAME=" + name + "'");
      out.println("</script>");
      out.close();

      return false;
    }

    List<BookmarkDto> result2 = bookmarkDao.getBmkList(email);

    if (result2.size() > 4) {
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      out.println("<script>");
      out.println("alert('즐겨찾기 개수가 초과되었습니다. (5개까지 가능)')");
      out.println("location.href='/parkSearch.pa?PARKING_NAME=" + name + "'");
      out.println("</script>");
      out.close();

      return false;
    }

    ParkDto parkDto = parkDao.getDetail(name);

    System.out.println("add bmk start");
    bookmarkDao.addBmk(email, parkDto.getParking_name(), parkDto.getAddr(), parkDto.getTel());
    System.out.println("add bmk end");

    response.setContentType("text/html; charset=utf-8");
    PrintWriter out = response.getWriter();
    out.println("<script>");
    out.println("alert('즐겨찾기에 추가되었습니다.')");
    out.println("location.href='/parkSearch.pa?PARKING_NAME=" + name + "'");
    out.println("</script>");
    out.close();

    return true;
  }

}
