package sisap

class TurmaDisciplina {

	//static mapWith="mongo"

	static belongsTo = [turma: Turma, disciplina: Disciplina]
	
	String nome_turma 
	String nome_disciplina
	String periodo
	
	Date data_inicio
	Date data_fim 
	
    static constraints = {
		nome_turma(nullable: false, blank: false)
		nome_disciplina(nullable: false, blank: false)
    }
}
