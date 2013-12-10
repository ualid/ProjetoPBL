package sisap

class TipoAtividade2 {

	//static mapWith="mongo"
	
	String nome	
	
    static constraints = {
		nome(nullable: false,blank: false)
	 }
	String toString(){
		return nome
	}
}
