package sisap

class Grupo {
    static mapWith="mongo"

    String nome
    String cor

    static hasMany = [alunos: Pessoa]

    static constraints = {
    }
}
