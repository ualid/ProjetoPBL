package sisap

class TipoAtividade {

	//static mapWith="mongo"
	
	String nome	
    static constraints = {
		nome(nullable: false,blank: false)
	 }
	String toString(){
		return nome
	}
}
