package model.park;

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
public class ParkDaoImpl implements ParkDao {

  private JdbcTemplate jdbcTemplate;

  @Autowired
  public ParkDaoImpl(JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  @Override
  public ParkDto getDetail(String name) {
    String sql = "SELECT * FROM SPARK WHERE PARKING_NAME = ?";

    return jdbcTemplate.queryForObject(sql, new RowMapper<ParkDto>() {

      @Override
      public ParkDto mapRow(ResultSet rs, int arg1) throws SQLException {
        ParkDto dto = new ParkDto();

        dto.setParking_code(rs.getString("PARKING_CODE"));
        dto.setParking_name(rs.getString("PARKING_NAME"));
        dto.setAddr(rs.getString("ADDR"));
        dto.setParking_type(rs.getString("PARKING_TYPE"));
        dto.setParking_type_nm(rs.getString("PARKING_TYPE_NM"));
        dto.setOperation_rule(rs.getString("OPERATION_RULE"));
        dto.setOperation_rule_nm(rs.getString("OPERATION_RULE_NM"));
        dto.setTel(rs.getString("TEL"));
        dto.setCapacity(rs.getString("CAPACITY"));
        dto.setCur_parking(rs.getString("CUR_PARKING"));
        dto.setPay_yn(rs.getString("PAY_YN"));
        dto.setPay_nm(rs.getString("PAY_NM"));
        dto.setNight_free_open(rs.getString("NIGHT_FREE_OPEN"));
        dto.setNight_free_open_nm(rs.getString("NIGHT_FREE_OPEN_NM"));
        dto.setWeekday_begin_time(rs.getString("WEEKDAY_BEGIN_TIME"));
        dto.setWeekday_end_time(rs.getString("WEEKDAY_END_TIME"));
        dto.setWeekend_begin_time(rs.getString("WEEKEND_BEGIN_TIME"));
        dto.setWeekend_end_time(rs.getString("WEEKEND_END_TIME"));
        dto.setHoliday_begin_time(rs.getString("HOLIDAY_BEGIN_TIME"));
        dto.setHoliday_end_time(rs.getString("HOLIDAY_END_TIME"));
        dto.setSaturday_pay_yn(rs.getString("SATURDAY_PAY_YN"));
        dto.setSaturday_pay_nm(rs.getString("SATURDAY_PAY_NM"));
        dto.setHoliday_pay_yn(rs.getString("HOLIDAY_PAY_YN"));
        dto.setHoliday_pay_nm(rs.getString("HOLIDAY_PAY_NM"));
        dto.setFulltime_monthly(rs.getString("FULLTIME_MONTHLY"));
        dto.setRates(rs.getString("RATES"));
        dto.setTime_rate(rs.getString("TIME_RATE"));
        dto.setAdd_rates(rs.getString("ADD_RATES"));
        dto.setAdd_time_rate(rs.getString("ADD_TIME_RATE"));
        dto.setDay_maximum(rs.getString("DAY_MAXIMUM"));
        dto.setLat(rs.getString("LAT"));
        dto.setLng(rs.getString("LNG"));

        return dto;
      }
    }, name);
  }
}