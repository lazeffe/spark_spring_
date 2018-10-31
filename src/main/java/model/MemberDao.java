package model;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {

  MemberDto memberCheck(String email);
  void memberInsert(String email, String pw, String name, String age, String gender);
  MemberDto getDetail(String email);
  void memberModify(String email, String new_pw);

}
