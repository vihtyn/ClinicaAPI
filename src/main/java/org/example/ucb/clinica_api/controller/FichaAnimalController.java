package org.example.ucb.clinica_api.controller;

import org.example.ucb.clinica_api.control.RepositorioDeFichaAnimal;
import org.example.ucb.clinica_api.model.FichaAnimal;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

@RestController
@RequestMapping("/api/fichas")
@CrossOrigin(origins = "*")
public class FichaAnimalController {

    @Autowired
    private RepositorioDeFichaAnimal repoFichaMongo;

    @GetMapping("/{rfid}")
    public ResponseEntity<FichaAnimal> getFichaAnimal(@PathVariable String rfid) {

        Optional<FichaAnimal> ficha = repoFichaMongo.findById(rfid);

        if(ficha.isPresent()) {
            return ResponseEntity.ok(ficha.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
