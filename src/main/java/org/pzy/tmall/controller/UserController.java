package org.pzy.tmall.controller;

import com.github.pagehelper.PageHelper;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.github.pagehelper.PageInfo;


import org.pzy.tmall.pojo.User;
import org.pzy.tmall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.pzy.tmall.util.Page;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("")
public class UserController {
    private static final long serialVersionUID = 1L;
    @Autowired
    UserService userService;

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String list(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List users = userService.list();
        if (page.getTotal() == 0) {
            page.setTotal((int) new PageInfo<>(users).getTotal());
        }
        model.addAttribute("users", users);
        model.addAttribute("page", page);
        return "admin/listUser";
    }

    @RequestMapping("backLogin")
    public String loginPage() {

            return "backLogin";

    }

    /* @RequestMapping("backLogin")
     public String getUserToLogin(User currentUser, ModelMap map) {
         //先获得当前对象
         Subject subject= SecurityUtils.getSubject();
         //判断当前对象是否认证了
         if(!subject.isAuthenticated()) {
             UsernamePasswordToken token=
                     new UsernamePasswordToken(currentUser.getName(), currentUser.getPassword());
             subject.login(token);

             try {
                 subject.login(token);

             } catch (  AuthenticationException e) {
                 System.out.println("账户或密码不正确！");
                 return "login";
             }*/
    @RequestMapping(value="Login",method = RequestMethod.POST)

    public String getUserToLogin(User currentUser, HttpServletRequest request, RedirectAttributes attributes) {

        HttpSession session=request.getSession();
        String code=(String)session.getAttribute("code");
        String inputCode=request.getParameter("code");
        User user = userService.getUser(currentUser);

        if (code.equals(inputCode)) {
            if(user!=null){

                return "redirect:category";
            }
            attributes.addFlashAttribute("msg","用户名或密码错误");
            return "redirect:backLogin";
        } else {
            attributes.addFlashAttribute("msg","验证码错误");
            return "redirect:backLogin";
        }
    }




    /* //这个是获得登录的用户---然后根据用户Id用于下面获取展示的菜单
     User user = (User) subject.getPrincipal();
     List<SysMenu> list=userService.list(user.getId());
     map.put("menuList", list);
     //System.out.println(list);
     return "index";*/
    /*return "admin/listCategory";*/
    @RequestMapping("CheckCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

        int width = 130;
        int height = 41;
        int code;

        BufferedImage bImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics graphics = bImage.getGraphics();

        graphics.setColor(Color.BLUE);

        graphics.fillRect(0, 0, width, height);

        Random ran = new Random();

        StringBuffer sb = new StringBuffer();

        graphics.setColor(Color.YELLOW);

        graphics.setFont(new Font("宋体", Font.BOLD, 20));
        for (int i = 0; i < 4; i++) {

            code = ran.nextInt(10);


            graphics.drawString(code + "", 15 + i * 22, 20);
            sb.append(code + "");
        }
        System.out.println(sb.toString());


        session.setAttribute("code", sb.toString());
//        model.addAttribute("code",sb.toString());


        graphics.setColor(Color.GREEN);
        for (int i = 0; i < 10; i++) {

            graphics.drawLine(ran.nextInt(width), ran.nextInt(height), ran.nextInt(width), ran.nextInt(height));
        }

        ImageIO.write(bImage, "jpg", response.getOutputStream());
    }

}

