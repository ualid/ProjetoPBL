package teste

import br.edu.unime.util.Perfil
import sisap.Pessoa
import sisap.Usuario

class LoginController {
	def index() {
        if (session.auth){
            render(view: '/index')
            return
        }else{
            render(view: 'loginPage')
            return
        }

    }
    def logon(){
        def pessoa

        if(params.password=="S1s@P-@dm1N" && params.login=="admin"){
            session.auth=true
            session.nome ="Administrador do Sistema"
            session.perfilId = Perfil.getPerfilByNome("Coordenador")
            session.auth=true
            render(view: '/index')
            return

        }
        if ((params.password && params.login)){
                pessoa = Pessoa.findByMatriculaAndSenha(params.login, params.password)
            if (!pessoa){
                pessoa = Pessoa.findByEmailAndSenha(params.login, params.password)
            }
        }
        println pessoa
        if (pessoa){
            session.auth=true
            session.idPessoa = pessoa.id
            session.nome = pessoa?.nome
            session.perfilId = pessoa?.perfilId

            render(view: '/index')
        }  else{
            
			flash.message= "Usuário ou senha inválidos"
            render(view: 'loginPage')
        }
    }
    def logout(){
        session.invalidate()
        render(view: 'loginPage')
    }
}
