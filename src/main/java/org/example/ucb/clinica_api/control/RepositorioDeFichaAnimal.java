package org.example.ucb.clinica_api.control;

import org.example.ucb.clinica_api.model.FichaAnimal;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioDeFichaAnimal extends MongoRepository<FichaAnimal, String> {

}
