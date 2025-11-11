package org.example.ucb.clinica_api.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.List;

@Document(collection = "fichas_animais")
public class FichaAnimal {

    @Id
    private String rfid;
    private String nomeAnimal;
    private String especie;
    private String porte;
    private int idade;

    private DonoEmbed dono;

    private List<HistoricoConsulta> historicoConsultas;

    // Getters e Setters
    public String getRfid() { return rfid; }
    public void setRfid(String rfid) { this.rfid = rfid; }
    public String getNomeAnimal() { return nomeAnimal; }
    public void setNomeAnimal(String nomeAnimal) { this.nomeAnimal = nomeAnimal; }
    public String getEspecie() { return especie; }
    public void setEspecie(String especie) { this.especie = especie; }
    public String getPorte() { return porte; }
    public void setPorte(String porte) { this.porte = porte; }
    public int getIdade() { return idade; }
    public void setIdade(int idade) { this.idade = idade; }
    public DonoEmbed getDono() { return dono; }
    public void setDono(DonoEmbed dono) { this.dono = dono; }
    public List<HistoricoConsulta> getHistoricoConsultas() { return historicoConsultas; }
    public void setHistoricoConsultas(List<HistoricoConsulta> historicoConsultas) { this.historicoConsultas = historicoConsultas; }
}
