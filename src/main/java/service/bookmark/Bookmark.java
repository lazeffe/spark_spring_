package service.bookmark;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface Bookmark {

  int getBmkChk(HttpServletRequest request, HttpServletResponse response, String email, String name) throws IOException;

}
