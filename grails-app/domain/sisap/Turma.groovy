package sisap

class Turma {

	//static mapWith="mongo"
	
	String nome
	Date data_inicio
	Date data_fim
	String descricao
	
	//static hasMany = [disciplinas: Disciplina]
	static belongsTo = [turmaDisciplina : TurmaDisciplina]
	
    static constraints = {
		nome(nullable: false, blank: false)
		data_inicio(nullable: false, blank: false)
		data_fim(nullable: true, blank: true)
		descricao(nullable: true, blank: true)
//		turmaDisciplina(nullable: true, blank: true)
    }
}
