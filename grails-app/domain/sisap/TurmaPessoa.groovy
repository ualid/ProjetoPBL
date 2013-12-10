package sisap
import br.edu.unime.util.Perfil

class TurmaPessoa {
  //  static mapWith="mongo"


    Integer cod_Turma
	Integer cod_Pessoa
	
    static hasMany = [disciplinas: PeriodoDisciplina]


     static belongsTo = [curso: Curso]

    static transients = ['perfil']

    static constraints = {
        cod_Turma(nullable: false, blank: false)
        cod_Pessoa(nullable: false, blank: false)
    }

}