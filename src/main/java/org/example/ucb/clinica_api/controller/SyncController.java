package org.example.ucb.clinica_api.controller;

import org.example.ucb.clinica_api.control.SyncService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/admin")
public class SyncController {

    @Autowired
    private SyncService syncService;

    @GetMapping("/sync-mongo")
    public ResponseEntity<String> triggerSync() {
        try {
            syncService.syncMySqlToMongo();
            return ResponseEntity.ok("Sincronização MySQL -> MongoDb concluida com sucesso!");
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body("Erro durante a sincronização " + e.getMessage());
        }
    }
}
