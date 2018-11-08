package model.bookmark;

import java.io.IOException;
import java.util.List;

public interface BookmarkDao {

  List<BookmarkDto> getBmkList(String email);
  void addBmk(String email, String name, String addr, String tel);
  void deleteBmk(String email, String bmkName);
  BookmarkDto bmkListChk(String email, String name) throws IOException;


}
