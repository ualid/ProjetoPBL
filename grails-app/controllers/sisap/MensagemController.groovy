package sisap

import org.springframework.dao.DataIntegrityViolationException

class MensagemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mensagemInstanceList: Mensagem.list(params), mensagemInstanceTotal: Mensagem.count()]
    }

    def create() {
        [mensagemInstance: new Mensagem(params)]
    }

    def save() {
        def mensagemInstance = new Mensagem(params)
        if (!mensagemInstance.save(flush: true)) {
            render(view: "create", model: [mensagemInstance: mensagemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
        redirect(action: "show", id: mensagemInstance.id)
    }

    def show(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        [mensagemInstance: mensagemInstance]
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
            redirect(action: "list")
            return
        }

        try {
            mensagemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "show", id: id)
        }
    }
}
