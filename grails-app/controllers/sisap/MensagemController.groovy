package sisap

import org.springframework.dao.DataIntegrityViolationException
import wslite.soap.SOAPClient

class MensagemController {

    def mailService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def listEntradas(Integer max) {
        def pessoa  = Pessoa.read(session.idPessoa)

        params.max = Math.min(max ?: 10, 100)

//        def mensagens = MensagemDestinatario.findAllByDestinatario(pessoa, [max: params.max, sort: 'mensagem.dataMensagem', order: 'asc'])


        render(view: 'listEntradas', model: [mensagemInstanceList: mensagens, mensagemInstanceTotal: mensagens.size()])
    }

    def listEnviadas(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort= "dataMensagem"
        params.order = "desc"

        def remetente  = Pessoa.read(session.idPessoa)

        def mensagens = Mensagem.withCriteria {

            order("dataMensagem", "desc")

            eq("remetente", remetente)
        }


        [mensagemInstanceList: mensagens, mensagemInstanceTotal: mensagens.size()]
    }

    def create() {
        [mensagemInstance: new Mensagem(params)]
    }

    def show(Long id) {
        def mensagemDestinatario = MensagemDestinatario.get(id)
        def mensagemDestinatarioVer = MensagemDestinatario.findByMensagemAndDestinatario(mensagemDestinatario.mensagem, Pessoa.read(session.idPessoa))

        if(mensagemDestinatario && mensagemDestinatario?.id == mensagemDestinatarioVer?.id && mensagemDestinatario?.lida == false){
            mensagemDestinatario.lida = true
            mensagemDestinatario.save(flush: true)
        }
        if (!mensagemDestinatarioVer) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        [mensagemInstance: mensagemDestinatarioVer.mensagem]
    }

    def edit(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        [mensagemInstance: mensagemInstance]
    }

    def save() {
        def mensagemInstance = new Mensagem(params)
        def remetente  =Pessoa.get(session.idPessoa)


        mensagemInstance.remetente =remetente
        mensagemInstance.dataMensagem = new Date()
        mensagemInstance.setStatus(true)

        def listAluno = []

        params.alunos.each {
            def pessoa = Pessoa.get(it)

            listAluno  << pessoa
        }

        mensagemInstance.emailDestinatario = listAluno.email

        println listAluno
        mensagemInstance.destinatarios = listAluno




        if (!mensagemInstance.save(flush: true)) {
            render(view: "create", model: [mensagemInstance: mensagemInstance])
            return
        }

        mensagemInstance.remetente = remetente
        mensagemInstance.save(flush: true)



        listAluno.each {
           it.save(flush: true)

           def mensagemDestinatario
           mensagemDestinatario = new MensagemDestinatario()
           mensagemDestinatario.mensagem = mensagemInstance
           mensagemDestinatario.destinatario = it
           mensagemDestinatario.lida = false
           mensagemDestinatario.save(flush: true)

           def pessoaTemp = it
           mailService.sendMail {
                to pessoaTemp.email
                subject mensagemInstance.titulo + " - " + mensagemInstance.remetente
                body mensagemInstance.mensagem
           }
        }


        remetente.save(flush: true)

        flash.message = "Mensagem enviada!"
        redirect(action: "listEntradas", id: mensagemInstance.id)
    }

    def update(Long id, Long version) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mensagemInstance.version > version) {
                mensagemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
                        "Another user has updated this Mensagem while you were editing")
                render(view: "edit", model: [mensagemInstance: mensagemInstance])
                return
            }
        }

        mensagemInstance.properties = params

        if (!mensagemInstance.save(flush: true)) {
            render(view: "edit", model: [mensagemInstance: mensagemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
        redirect(action: "show", id: mensagemInstance.id)
    }

    def delete(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "listEnviadas")
            return
        }

        try {
            mensagemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "listEnviadas")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "show", id: id)
        }
    }
    /*def ajaxPesquisaAlunos(Integer max){
        if (params.idCurso){
            def curso = Curso.read(params.idCurso)
            def alunos = Pessoa.findAllByCursoAndStatusAndPerfilId(curso, true, 1)
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: alunos, optionKey: "id", optionValue: "nome")
        }else{
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: ['':''], optionKey: "key", optionValue: "value")
        }

    }*/

    def ajaxPesquisaAlunos(Integer max){


        if (params.idDisciplina){
            def peridoDisciplina = PeriodoDisciplina.read(params.idDisciplina)


            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: peridoDisciplina.alunos, optionKey: "id", optionValue: "nome")
        }else{
            render g.select(id: "box1View", name: "box1View", multiple: "multiple", class: "multiple", style: "height: 250px", from: ['':''], optionKey: "key", optionValue: "value")
        }

    }
    def ajaxResposta = {
        def mensagemOrginal = Mensagem.get(params.mensagemOrginal)
        def resposta  = new Mensagem()


        resposta.properties = mensagemOrginal.properties
        resposta.dataMensagem = new Date()
        resposta.remetente = Pessoa.read(session.idPessoa)
        resposta.mensagem = params.resposta
        resposta.titulo = "RES: " + mensagemOrginal.titulo

        resposta.destinatarios = mensagemOrginal.destinatarios

        mensagemOrginal.destinatarios.each {
            def pessoaTemp = it
            mailService.sendMail {
                to pessoaTemp.email
                subject "RES: " + mensagemOrginal.titulo
                body resposta.mensagem
            }
        }
        resposta.save(flush: true)

        resposta.destinatarios.each {
            def mensagemDestinatario = new MensagemDestinatario(destinatario: it, mensagem: resposta, lida: false)
            mensagemDestinatario.save(flush: true)
        }

        mensagemOrginal.addToMensagens(resposta)

        mensagemOrginal.save(flush: true)

        render(template: 'templateResposta', model: [mensagemInstance: mensagemOrginal])

    }

}