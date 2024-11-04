public class Client {

    private String nome;
    private String localidade;

    
    public Client(String nome, String localidade) {
        this.nome = nome;
        this.localidade = localidade;
    }


    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }


    public String getLocalidade() {
        return localidade;
    }


    public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Client client = (Client) obj;
        return nome.equals(client.nome) && localidade.equals(client.localidade);
    }

    public String toString() {
        return String.format("%s [%s]", this.getNome(), this.getLocalidade());
    }
}