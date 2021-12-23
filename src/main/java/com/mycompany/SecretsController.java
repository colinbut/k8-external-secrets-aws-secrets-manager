package com.mycompany;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/secrets")
public class SecretsController {
    
    private static final String SECRET_KEY = "API_KEY";
    
    @GetMapping("/api_key")
    public Secret getSecret() {
        String apiKey = System.getenv(SECRET_KEY);
        return new Secret(SECRET_KEY, apiKey);
    }
}
