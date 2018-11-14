package service.api;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("/api")
@RequestMapping(value = "/api")
public class ApiController {

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "api";
    }
}