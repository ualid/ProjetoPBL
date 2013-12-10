package sisap

import org.springframework.dao.DataIntegrityViolationException

class TelefoneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [telefoneInstanceList: Telefone.list(params), telefoneInstanceTotal: Telefone.count()]
    }

    def create() {
        [telefoneInstance: new Telefone(params)]
    }

    def save() {
        def telefoneInstance = new Telefone(params)
        if (!telefoneInstance.save(flush: true)) {
            render(view: "create", model: [telefoneInstance: telefoneInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'telefone.label', default: 'Telefone'), telefoneInstance.id])
        redirect(action: "show", id: telefoneInstance.id)
    }

    def show(Long id) {
        def telefoneInstance = Telefone.get(id)
        if (!telefoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), id])
            redirect(action: "list")
            return
        }

        [telefoneInstance: telefoneInstance]
    }

    def edit(Long id) {
        def telefoneInstance = Telefone.get(id)
        if (!telefoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), id])
            redirect(action: "list")
            return
        }

        [telefoneInstance: telefoneInstance]
    }

    def update(Long id, Long version) {
        def telefoneInstance = Telefone.get(id)
        if (!telefoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (telefoneInstance.version > version) {
                telefoneInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefone.label', default: 'Telefone')] as Object[],
                          "Another user has updated this Telefone while you were editing")
                render(view: "edit", model: [telefoneInstance: telefoneInstance])
                return
            }
        }

        telefoneInstance.properties = params

        if (!telefoneInstance.save(flush: true)) {
            render(view: "edit", model: [telefoneInstance: telefoneInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'telefone.label', default: 'Telefone'), telefoneInstance.id])
        redirect(action: "show", id: telefoneInstance.id)
    }

    def delete(Long id) {
        def telefoneInstance = Telefone.get(id)
        if (!telefoneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), id])
            redirect(action: "list")
            return
        }

        try {
            telefoneInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'telefone.label', default: 'Telefone'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefone.label', default: 'Telefone'), id])
            redirect(action: "show", id: id)
        }
    }
}
