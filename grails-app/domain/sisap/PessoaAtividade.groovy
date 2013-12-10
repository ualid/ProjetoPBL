package sisap

class PessoaAtividade {
	//static mapWith="mongo"
	
	Integer qtd_horas
	Double nota
	String considerecao
	Date data_inicio
	Date data_fim
	Integer estado
	
	static belongsTo = [atividade: Atividade,pessoa: Pessoa]
    
	static constraints = {
    }
}
