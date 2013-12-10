package sisap

class Grupo {
  //  static mapWith="mongo"

    String nome

    static hasMany = [alunos: Pessoa]

    static constraints = {
    }
}
