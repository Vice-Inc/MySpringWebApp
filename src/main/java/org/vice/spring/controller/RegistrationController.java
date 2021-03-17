package org.vice.spring.controller;

import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.vice.spring.domain.User;
import org.vice.spring.domain.dto.recaptchaResponseDto;
import org.vice.spring.service.UserService;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Autowired
    private RestTemplate restTemplate;

    @Value("${recaptcha.secret}")
    private String secret;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam String password2,
                          @RequestParam("g-recaptcha-response") String recaptchaResponse,
                          @Valid User user,
                          BindingResult bindingResult,
                          Model model){

        String url = String.format(CAPTCHA_URL, secret, recaptchaResponse);
        recaptchaResponseDto response =
                restTemplate.postForObject(url, Collections.emptyList(), recaptchaResponseDto.class);

        if(!response.isSuccess()){
            model.addAttribute("captchaError", "Fill captcha");
        }

        boolean isPassword2Empty = StringUtils.isEmpty(password2);

        if(isPassword2Empty){
            model.addAttribute("password2Error", "Password confirmation can not be empty");
        }

        if(user.getPassword() != null
                && !user.getPassword().equals(password2)){
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if(isPassword2Empty || bindingResult.hasErrors() || !response.isSuccess()) {
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
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User activated");
        }else{
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "User not activated");
        }

        return "login";
    }
}
