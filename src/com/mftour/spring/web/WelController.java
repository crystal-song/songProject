package com.mftour.spring.web;

import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jfreebird on 15/1/13.
 */
@Controller
@RequestMapping("/wel")
public class WelController {

	@Autowired
	private IUserService userService;

	@Autowired
	private IGateService gateService;

	@RequestMapping(method = { RequestMethod.GET })
	public void index(Model model, HttpServletResponse reponse)
			throws Exception {
		reponse.sendRedirect("/");
	}

	@RequestMapping(value = "/account", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String account(Model model, HttpServletRequest request)
			throws Exception {
		Object o = request.getSession().getAttribute("name");

		if (o != null) {

			TUser user1 = userService.getUserByAccount(o.toString());

			List<TRegisterYeePay> li = gateService
					.queryTRegisterYeePayByName(user1.getName());
			if (li != null && li.size() != 0) {
				TRegisterYeePay registerYeePay1 = li.get(0);
				model.addAttribute("registerYeePay1", registerYeePay1);
			}

			model.addAttribute("user1", user1);
			return "accounts/user-info";

		}

		return "login";
	}

	@RequestMapping(value = "/help", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String help(Model model) throws Exception {

		return "help";
	}

}
