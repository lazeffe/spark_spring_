package model.member;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {

  MemberDto memberCheck(String email);
  void memberInsert(String email, String pw, String name, String age, String gender);
  MemberDto getDetail(String email);
  void modifyPW(String email, String new_pw);
  void deleteAcc(String email);

}
