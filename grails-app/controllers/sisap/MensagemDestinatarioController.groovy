package sisap

import org.springframework.dao.DataIntegrityViolationException

class MensagemDestinatarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mensagemDestinatarioInstanceList: MensagemDestinatario.list(params), mensagemDestinatarioInstanceTotal: MensagemDestinatario.count()]
    }

    def create() {
        [mensagemDestinatarioInstance: new MensagemDestinatario(params)]
    }

    def save() {
        def mensagemDestinatarioInstance = new MensagemDestinatario(params)
        if (!mensagemDestinatarioInstance.save(flush: true)) {
            render(view: "create", model: [mensagemDestinatarioInstance: mensagemDestinatarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), mensagemDestinatarioInstance.id])
        redirect(action: "show", id: mensagemDestinatarioInstance.id)
    }

    def show(Long id) {
        def mensagemDestinatarioInstance = MensagemDestinatario.get(id)
        if (!mensagemDestinatarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), id])
            redirect(action: "list")
            return
        }

        [mensagemDestinatarioInstance: mensagemDestinatarioInstance]
    }

    def edit(Long id) {
        def mensagemDestinatarioInstance = MensagemDestinatario.get(id)
        if (!mensagemDestinatarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), id])
            redirect(action: "list")
            return
        }

        [mensagemDestinatarioInstance: mensagemDestinatarioInstance]
    }

    def update(Long id, Long version) {
        def mensagemDestinatarioInstance = MensagemDestinatario.get(id)
        if (!mensagemDestinatarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mensagemDestinatarioInstance.version > version) {
                mensagemDestinatarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario')] as Object[],
                          "Another user has updated this MensagemDestinatario while you were editing")
                render(view: "edit", model: [mensagemDestinatarioInstance: mensagemDestinatarioInstance])
                return
            }
        }

        mensagemDestinatarioInstance.properties = params

        if (!mensagemDestinatarioInstance.save(flush: true)) {
            render(view: "edit", model: [mensagemDestinatarioInstance: mensagemDestinatarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), mensagemDestinatarioInstance.id])
        redirect(action: "show", id: mensagemDestinatarioInstance.id)
    }

    def delete(Long id) {
        def mensagemDestinatarioInstance = MensagemDestinatario.get(id)
        if (!mensagemDestinatarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), id])
            redirect(action: "list")
            return
        }

        try {
            mensagemDestinatarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario'), id])
            redirect(action: "show", id: id)
        }
    }
}
