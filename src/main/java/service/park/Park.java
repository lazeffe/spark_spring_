package service.park;

import model.park.ParkDto;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Park {

  ParkDto getParkDetail(String name);

}
