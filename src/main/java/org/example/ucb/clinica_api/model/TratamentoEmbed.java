package org.example.ucb.clinica_api.model;

public class TratamentoEmbed {

    private String tratamentoId;
    private String descricao;
    private boolean antibiotico;

    public String getTratamentoId() { return tratamentoId; }
    public void setTratamentoId(String tratamentoId) { this.tratamentoId = tratamentoId; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public boolean isAntibiotico() { return antibiotico; }
    public void setAntibiotico(boolean antibiotico) { this.antibiotico = antibiotico; }
}
