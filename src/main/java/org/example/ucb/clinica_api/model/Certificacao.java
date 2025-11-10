package org.example.ucb.clinica_api.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Certificacao")
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "numeroRegistro"
)
public class Certificacao {

    @Id
    @Column(name = "NumeroRegistro")
    private String numeroRegistro;

    @Column(name = "DataObtencao")
    private LocalDate dataObtencao;

    @Column(name = "InstituicaoCertificadora")
    private String instituicaoCertificadora;

    @ManyToOne
    @JoinColumn(name = "CRMV_certif", referencedColumnName = "CRMV")
    private Veterinario veterinario;

    @ManyToOne
    @JoinColumn(name = "ID_especialidade", referencedColumnName = "IDespecialidade")
    private Especialidade especialidade;

    public Certificacao() {}

    public Certificacao(String numeroRegistro, LocalDate dataObtencao, String instituicaoCertificadora, Veterinario veterinario) {
        this.numeroRegistro = numeroRegistro;
        this.dataObtencao = dataObtencao;
        this.instituicaoCertificadora = instituicaoCertificadora;
        this.veterinario = veterinario;
    }

    // Getters e Setters
    public String getNumeroRegistro() {
        return numeroRegistro;
    }
    public void setNumeroRegistro(String numeroRegistro) {
        this.numeroRegistro = numeroRegistro;
    }
    public LocalDate getDataObtencao() {
        return dataObtencao;
    }
    public void setDataObtencao(LocalDate dataObtencao) {
        this.dataObtencao = dataObtencao;
    }
    public String getInstituicaoCertificadora() {
        return instituicaoCertificadora;
    }
    public void setInstituicaoCertificadora(String instituicaoCertificadora) {
        this.instituicaoCertificadora = instituicaoCertificadora;
    }
    public Veterinario getVeterinario() {
        return veterinario;
    }
    public void setVeterinario(Veterinario veterinario) {
        this.veterinario = veterinario;
    }
    public Especialidade getEspecialidade() {
        return especialidade;
    }
    public void setEspecialidade(Especialidade especialidade) {
        this.especialidade = especialidade;
    }
}