package model.bookmark;

public class BookmarkDto {

  private String BOOKMARK_EMAIL;
  private String BOOKMARK_NAME;
  private String BOOKMARK_ADDR;
  private String BOOKMARK_TEL;


  public String getBOOKMARK_EMAIL() {
    return BOOKMARK_EMAIL;
  }

  public void setBOOKMARK_EMAIL(String bOOKMARK_EMAIL) {
    BOOKMARK_EMAIL = bOOKMARK_EMAIL;
  }

  public String getBOOKMARK_NAME() {
    return BOOKMARK_NAME;
  }

  public void setBOOKMARK_NAME(String BOOKMARK_NAME) {
    this.BOOKMARK_NAME = BOOKMARK_NAME;
  }

  public String getBOOKMARK_ADDR() {
    return BOOKMARK_ADDR;
  }

  public void setBOOKMARK_ADDR(String bOOKMARK_ADDR) {
    BOOKMARK_ADDR = bOOKMARK_ADDR;
  }

  public String getBOOKMARK_TEL() {
    return BOOKMARK_TEL;
  }

  public void setBOOKMARK_TEL(String bOOKMARK_TEL) {
    BOOKMARK_TEL = bOOKMARK_TEL;
  }

}
