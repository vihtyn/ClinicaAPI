package org.example.ucb.clinica_api.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
// Removidos imports de LocalTime e LocalDate
import java.util.List;

@Entity
@Table(name = "consulta")
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id"
)
public class Consulta {

    @Id
    @Column(name = "id")
    private String id;

    // CAMPOS REMOVIDOS (não existem no BD_clinica.sql)
    // private LocalDate dataConsulta;
    // private LocalTime horaConsulta;
    // private String tipo;

    private String diagnostico;

    @ManyToOne
    @JoinColumn(name = "id_animal", referencedColumnName = "RFID")
    private Animal animal;

    @ManyToOne
    @JoinColumn(name = "CRMV_veterinario")
    private Veterinario veterinario;

    @OneToMany(mappedBy = "consulta")
    private List<Tratamento> tratamentos;

    public Consulta() {}

    // --- Getters e Setters ATUALIZADOS ---
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getDiagnostico() {
        return diagnostico;
    }
    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }
    public Animal getAnimal() {
        return animal;
    }
    public void setAnimal(Animal animal) {
        this.animal = animal;
    }
    public Veterinario getVeterinario() {
        return veterinario;
    }
    public void setVeterinario(Veterinario veterinario) {
        this.veterinario = veterinario;
    }
    public List<Tratamento> getTratamentos() {
        return tratamentos;
    }
    public void setTratamentos(List<Tratamento> tratamentos) {
        this.tratamentos = tratamentos;
    }
}