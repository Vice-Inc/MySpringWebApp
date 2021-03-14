package org.vice.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.vice.spring.domain.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.vice.spring.domain.Message;
import org.vice.spring.repository.MessageRepository;

import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name,
                           Map<String, Object> model) {
        model.put("name", name);
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model){
        model.put("messages", messageRepository.findAll());
        return "main";
    }

    @PostMapping("/main")
    public String add(@AuthenticationPrincipal User user,
                      @RequestParam String text,
                      @RequestParam String tag,
                      Map<String, Object> model){
        Message message = new Message(text, tag, user);
        messageRepository.save(message);
        model.put("messages", messageRepository.findAll());
        return "main";
    }

    @PostMapping("/main/filter")
    public String filter(@RequestParam String filter,
                      Map<String, Object> model){
        Iterable<Message> messages;

        if(filter != null && !filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
        }else{
            messages = messageRepository.findAll();
        }

        model.put("messages", messages);
        return "main";
    }
}