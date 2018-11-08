package model.park;

import org.springframework.stereotype.Repository;

public interface ParkDao {

  ParkDto getDetail(String name);

}
