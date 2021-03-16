package org.vice.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.vice.spring.domain.User;
import org.vice.spring.service.UserService;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    UserService userService;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid User user,
                          BindingResult bindingResult,
                          Model model){

        if(user.getPassword() != null
                && !user.getPassword().equals(user.getPassword2())){
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if(bindingResult.hasErrors()) {
            model.mergeAttributes(ControllerUtils.getErrors(bindingResult));
            return "registration";
        }

        if(!userService.addUser(user)){
            model.addAttribute("message", "User exists!");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(@PathVariable String code,
                           Model model){
        if(userService.activateUser(code)){
            model.addAttribute("message", "User activated");
        }else{
            model.addAttribute("message", "User not activated");
        }

        return "login";
    }
}
