package model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class MemberDaoImpl implements MemberDao {

  private JdbcTemplate jdbcTemplate;

  @Autowired
  public MemberDaoImpl(JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }
  
  @Override
  public MemberDto memberCheck(String email) {
    String sql = "SELECT * FROM MEMBER WHERE EMAIL = ?";

    try {
      return jdbcTemplate.queryForObject(sql, new RowMapper<MemberDto>() {
        @Override
        public MemberDto mapRow(ResultSet rs, int arg1) throws SQLException {
          MemberDto dto = new MemberDto();

          dto.setPassword(rs.getString("PASSWORD"));
          dto.setName(rs.getString("NAME"));

          return dto;
        }
      }, email);

    } catch (EmptyResultDataAccessException e) {
      return null;
    }
  }

  @Override
  public void memberInsert(final String email, final String pw, final String name, final String age, final String gender) {

    this.jdbcTemplate.update(new PreparedStatementCreator() {

      @Override
      public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
        String query = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.setString(4, age);
        pstmt.setString(5, gender);
        return pstmt;
      }
    });
  }

  @Override
  public MemberDto getDetail(String email) {
    String sql = "SELECT * FROM MEMBER WHERE EMAIL=?";

    return jdbcTemplate.queryForObject(sql, new RowMapper<MemberDto>() {

      @Override
      public MemberDto mapRow(ResultSet rs, int arg1) throws SQLException {
        MemberDto dto = new MemberDto();

        dto.setEmail(rs.getString("EMAIL"));
        dto.setPassword(rs.getString("PASSWORD"));
        dto.setName(rs.getString("NAME"));
        dto.setAge(rs.getString("AGE"));
        dto.setGender(rs.getString("GENDER"));

        return dto;
      }
    }, email);
  }

  @Override
  public void modifyPW(final String email, final String new_pw) {

    this.jdbcTemplate.update(new PreparedStatementCreator() {

      @Override
      public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
        String query = "UPDATE MEMBER SET PASSWORD = ? WHERE EMAIL = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, new_pw);
        pstmt.setString(2, email);
        return pstmt;
      }
    });
  }

  @Override
  public void deleteAcc(final String email) {

    this.jdbcTemplate.update(new PreparedStatementCreator() {

      @Override
      public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
        String query = "DELETE FROM MEMBER WHERE EMAIL = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        return pstmt;
      }
    });
  }

}