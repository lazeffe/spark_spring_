package service.park;

import model.park.ParkDao;
import model.park.ParkDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParkImpl implements Park {

  private ParkDao parkDao;

  @Autowired
  public ParkImpl(ParkDao parkDao) {
    this.parkDao = parkDao;
  }

  /*@Override
  public ParkDto getParkDetail(String name) {
    return parkDao.getDetail(name);
  }*/

  @Override
  public ParkDto getParkDetail(String name) {
    ParkDto parkDto = parkDao.getDetail(name);

    String dummy = "";
    dummy = parkDto.getTel();
    dummy = dummy.trim();

    if (dummy.equals("NA")) {
      parkDto.setTel("-");
    }

    dummy = parkDto.getFulltime_monthly();
    dummy = dummy.trim();
    if (dummy.equals("NA") || dummy.equals("0")) {
      parkDto.setFulltime_monthly("-");
    } else if (dummy.length() > 3) {
      dummy = dummy.substring(0, dummy.length() - 3) + "," + dummy.substring(dummy.length() - 3, dummy.length());
      parkDto.setFulltime_monthly(dummy);
    }

    dummy = parkDto.getDay_maximum();
    dummy = dummy.trim();
    if (dummy.equals("NA") || dummy.equals("0")) {
      parkDto.setDay_maximum("-");
    } else if (dummy.length() > 3) {
      dummy = dummy.substring(0, dummy.length() - 3) + "," + dummy.substring(dummy.length() - 3, dummy.length());
      parkDto.setDay_maximum(dummy);
    }

    dummy = parkDto.getRates();
    dummy = dummy.trim();
    if (dummy.equals("NA") || dummy.equals("0")) {
      parkDto.setRates("-");
    } else if (dummy.length() > 3) {
      dummy = dummy.substring(0, dummy.length() - 3) + "," + dummy.substring(dummy.length() - 3, dummy.length());
      parkDto.setRates(dummy);
    }

    dummy = parkDto.getTime_rate();
    dummy = dummy.trim();
    if (dummy.equals("NA") || dummy.equals("0")) {
      parkDto.setTime_rate("-");
    } else if (dummy.length() > 3) {
      dummy = dummy.substring(0, dummy.length() - 3) + "," + dummy.substring(dummy.length() - 3, dummy.length());
      parkDto.setTime_rate(dummy);
    }

    dummy = parkDto.getAdd_rates();
    dummy = dummy.trim();
    if (dummy.equals("NA") || dummy.equals("0")) {
      parkDto.setAdd_rates("-");
    } else if (dummy.length() > 3) {
      dummy = dummy.substring(0, dummy.length() - 3) + "," + dummy.substring(dummy.length() - 3, dummy.length());
      parkDto.setAdd_rates(dummy);
    }

    dummy = parkDto.getAdd_time_rate();
    dummy = dummy.trim();
    if (dummy.equals("NA") || dummy.equals("0")) {
      parkDto.setAdd_time_rate("-");
    } else if (dummy.length() > 3) {
      dummy = dummy.substring(0, dummy.length() - 3) + "," + dummy.substring(dummy.length() - 3, dummy.length());
      parkDto.setAdd_time_rate(dummy);
    }

    parkDto.setWeekday_begin_time(timeSet(parkDto.getWeekday_begin_time()));
    parkDto.setWeekday_end_time(timeSet(parkDto.getWeekday_end_time()));
    parkDto.setWeekend_begin_time(timeSet(parkDto.getWeekend_begin_time()));
    parkDto.setWeekend_end_time(timeSet(parkDto.getWeekend_end_time()));
    parkDto.setHoliday_begin_time(timeSet(parkDto.getHoliday_begin_time()));
    parkDto.setHoliday_end_time(timeSet(parkDto.getHoliday_end_time()));

    return parkDto;
  }

  private String timeSet(String before) {
    int beforeInt = Integer.parseInt(before);

    String after;

    if (beforeInt == 0) {
      after = "00:00";
    } else if (beforeInt < 1200) {
      after = "am " + before.substring(0, 1) + ":00";
    } else {
      after = "pm " + Integer.toString(beforeInt - 1200).substring(0, 1) + ":00";
    }

    return after;
  }

}
