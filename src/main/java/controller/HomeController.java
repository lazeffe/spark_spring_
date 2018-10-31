package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

  @RequestMapping("/home.ho")
  protected ModelAndView handleRequestInternal(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {

    Map<String, Object> model = new HashMap<String, Object>();
    /*model.put("itemList", list);*/
    return new ModelAndView("home", model);
  }

}
