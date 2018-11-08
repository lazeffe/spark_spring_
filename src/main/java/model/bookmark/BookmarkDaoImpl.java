package model.bookmark;

import model.member.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import service.bookmark.Bookmark;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

  private JdbcTemplate jdbcTemplate;

  @Autowired
  public BookmarkDaoImpl(JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  @Override
  public List<BookmarkDto> getBmkList(String email) {
    String sql = "SELECT * FROM BOOKMARK WHERE BOOKMARK_EMAIL = ?";
    List<BookmarkDto> bmkList = new ArrayList<BookmarkDto>();

    try {
      return jdbcTemplate.query(sql, new RowMapper<BookmarkDto>() {
        @Override
        public BookmarkDto mapRow(ResultSet rs, int arg1) throws SQLException {
          BookmarkDto dto = new BookmarkDto();

          dto.setBOOKMARK_NAME(rs.getString("BOOKMARK_NAME"));
          dto.setBOOKMARK_ADDR(rs.getString("BOOKMARK_ADDR"));
          dto.setBOOKMARK_TEL(rs.getString("BOOKMARK_TEL"));

          return dto;
        }
      }, email);

    } catch (EmptyResultDataAccessException e) {
      return null;
    }
  }

  @Override
  public void addBmk(String email, String name, String addr, String tel) {

    this.jdbcTemplate.update(new PreparedStatementCreator() {

      @Override
      public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
        String query = "INSERT INTO BOOKMARK VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, name);
        pstmt.setString(3, addr);
        pstmt.setString(4, tel);
        return pstmt;
      }
    });
  }

  @Override
  public void deleteBmk(final String email, final String bmkName) {

    this.jdbcTemplate.update(new PreparedStatementCreator() {

      @Override
      public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
        String query = "DELETE FROM BOOKMARK WHERE BOOKMARK_EMAIL = ? and BOOKMARK_NAME = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, bmkName);
        return pstmt;
      }
    });
  }

  @Override
  public BookmarkDto bmkListChk(String email, String name) throws IOException {
    System.out.println("over chk");
    String sql = "SELECT * FROM BOOKMARK WHERE BOOKMARK_EMAIL = ? AND BOOKMARK_NAME = ?";

    try {

      return jdbcTemplate.queryForObject(sql, new RowMapper<BookmarkDto>() {

        @Override
        public BookmarkDto mapRow(ResultSet rs, int arg1) throws SQLException {
          BookmarkDto dto = new BookmarkDto();

          dto.setBOOKMARK_NAME(rs.getString("BOOKMARK_NAME"));

          return dto;
        }
      }, email, name);

    } catch (EmptyResultDataAccessException e) {

      return null;
    }
  }

}
