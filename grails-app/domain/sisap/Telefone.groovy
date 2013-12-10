package sisap
import br.edu.unime.util.Perfil

class Telefone {
  //  static mapWith="mongo"

    String ddd
    String num_telefone

    static belongsTo = [pessoa: Pessoa]

    static constraints = {
        num_telefone(nullable: false, blank: false)
    }

}