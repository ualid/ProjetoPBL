package sisap

class Atividade2 { 
	//static mapWith="mongo"

	//@Column() pesquisar
    String nome
    String descricao
	
	Date data_inicio
	Date data_fim
	Integer quantidade_horas
	Integer ativo
	 	
	//static hasMany = [disciplinas: Disciplina]
	static belongsTo = [tipoAtividade2: TipoAtividade, atividade: Atividade, disciplina:Disciplina]
	 
    static constraints = {
        descricao(nullable: false,blank: false)
        nome(nullable: false,blank: false , unique: true)
        data_inicio(nullable: false,blank: false)
        atividade(nullable: true)
        quantidade_horas(nullable: true,blank: true)
		 
    }
     @Override
    String toString(){
        return nome
    }
	

	
}
