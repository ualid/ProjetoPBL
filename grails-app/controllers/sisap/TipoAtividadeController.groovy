package sisap

import org.springframework.dao.DataIntegrityViolationException

class TipoAtividadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoAtividadeInstanceList: TipoAtividade.list(params), tipoAtividadeInstanceTotal: TipoAtividade.count()]
    }

    def create() {
        [tipoAtividadeInstance: new TipoAtividade(params)]
    }

    def save() {
        def tipoAtividadeInstance = new TipoAtividade(params)
        if (!tipoAtividadeInstance.save(flush: true)) {
            render(view: "create", model: [tipoAtividadeInstance: tipoAtividadeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), tipoAtividadeInstance.id])
        redirect(action: "show", id: tipoAtividadeInstance.id)
    }

    def show(Long id) {
        def tipoAtividadeInstance = TipoAtividade.get(id)
        if (!tipoAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), id])
            redirect(action: "list")
            return
        }

        [tipoAtividadeInstance: tipoAtividadeInstance]
    }

    def edit(Long id) {
        def tipoAtividadeInstance = TipoAtividade.get(id)
        if (!tipoAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), id])
            redirect(action: "list")
            return
        }

        [tipoAtividadeInstance: tipoAtividadeInstance]
    }

    def update(Long id, Long version) {
        def tipoAtividadeInstance = TipoAtividade.get(id)
        if (!tipoAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoAtividadeInstance.version > version) {
                tipoAtividadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoAtividade.label', default: 'TipoAtividade')] as Object[],
                          "Another user has updated this TipoAtividade while you were editing")
                render(view: "edit", model: [tipoAtividadeInstance: tipoAtividadeInstance])
                return
            }
        }

        tipoAtividadeInstance.properties = params

        if (!tipoAtividadeInstance.save(flush: true)) {
            render(view: "edit", model: [tipoAtividadeInstance: tipoAtividadeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), tipoAtividadeInstance.id])
        redirect(action: "show", id: tipoAtividadeInstance.id)
    }

    def delete(Long id) {
        def tipoAtividadeInstance = TipoAtividade.get(id)
        if (!tipoAtividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoAtividadeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoAtividade.label', default: 'TipoAtividade'), id])
            redirect(action: "show", id: id)
        }
    }
}
