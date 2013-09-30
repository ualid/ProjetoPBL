package sisap

import org.springframework.dao.DataIntegrityViolationException

class PessoaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        println params
        def pessoaInstanceList = Pessoa.withCriteria(max: params.max, offset: params.offset) {
             maxResults(params.max)
            firstResult(params.offset ? params.offset.toInteger() : 0)
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.matricula){
                ilike('matricula', "%$params.matricula%")
            }
        }
        def pessoaInstanceTotal = Pessoa.createCriteria().count(){
            if (params.nome){
                ilike('nome', "%$params.nome%")
            }
            if (params.matricula){
                ilike('matricula', "%$params.matricula%")
            }
        }
        [pessoaInstanceList: pessoaInstanceList, pessoaInstanceTotal: pessoaInstanceTotal]
    }

    def create() {
        [pessoaInstance: new Pessoa(params)]
    }

    def save() {
        def pessoaInstance = new Pessoa(params)



        if (!pessoaInstance.save(flush: true)) {
            render(view: "create", model: [pessoaInstance: pessoaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.id])
        redirect(action: "show", id: pessoaInstance.id)
    }

    def show(Long id) {
        def pessoaInstance = Pessoa.get(id)


        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }

        [pessoaInstance: pessoaInstance]
    }

    def edit(Long id) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }

        [pessoaInstance: pessoaInstance]
    }

    def update(Long id, Long version) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pessoaInstance.version > version) {
                pessoaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'pessoa.label', default: 'Pessoa')] as Object[],
                        "Another user has updated this Pessoa while you were editing")
                render(view: "edit", model: [pessoaInstance: pessoaInstance])
                return
            }
        }

        pessoaInstance.properties = params

        if (!pessoaInstance.save(flush: true)) {
            render(view: "edit", model: [pessoaInstance: pessoaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.id])
        redirect(action: "show", id: pessoaInstance.id)
    }

    def delete(Long id) {
        println params
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }

        try {
            pessoaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "show", id: id)
        }
    }
}
