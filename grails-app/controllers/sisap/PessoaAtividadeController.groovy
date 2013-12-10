package sisap

import org.springframework.dao.DataIntegrityViolationException

class PessoaAtividadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pessoaAtividadeInstanceList: PessoaAtividade.list(params), pessoaAtividadeInstanceTotal: PessoaAtividade.count()]
    }

    def create() {
        [pessoaAtividadeInstance: new PessoaAtividade(params)]
    }

    def save() {
        def pessoaAtividadeInstance = new PessoaAtividade(params)
        if (!pessoaAtividadeInstance.save(flush: true)) {
            render(view: "create", model: [pessoaAtividadeInstance: pessoaAtividadeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), pessoaAtividadeInstance.id])
        redirect(action: "show", id: pessoaAtividadeInstance.id)
    }

    def show(Long id) {
        def pessoaAtividadeInstance = PessoaAtividade.get(id)
        if (!pessoaAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), id])
            redirect(action: "list")
            return
        }

        [pessoaAtividadeInstance: pessoaAtividadeInstance]
    }

    def edit(Long id) {
        def pessoaAtividadeInstance = PessoaAtividade.get(id)
        if (!pessoaAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), id])
            redirect(action: "list")
            return
        }

        [pessoaAtividadeInstance: pessoaAtividadeInstance]
    }

    def update(Long id, Long version) {
        def pessoaAtividadeInstance = PessoaAtividade.get(id)
        if (!pessoaAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pessoaAtividadeInstance.version > version) {
                pessoaAtividadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade')] as Object[],
                          "Another user has updated this PessoaAtividade while you were editing")
                render(view: "edit", model: [pessoaAtividadeInstance: pessoaAtividadeInstance])
                return
            }
        }

        pessoaAtividadeInstance.properties = params

        if (!pessoaAtividadeInstance.save(flush: true)) {
            render(view: "edit", model: [pessoaAtividadeInstance: pessoaAtividadeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), pessoaAtividadeInstance.id])
        redirect(action: "show", id: pessoaAtividadeInstance.id)
    }

    def delete(Long id) {
        def pessoaAtividadeInstance = PessoaAtividade.get(id)
        if (!pessoaAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), id])
            redirect(action: "list")
            return
        }

        try {
            pessoaAtividadeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pessoaAtividade.label', default: 'PessoaAtividade'), id])
            redirect(action: "show", id: id)
        }
    }
}
