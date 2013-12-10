package sisap

import org.springframework.dao.DataIntegrityViolationException

class TipoAtividade2Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoAtividade2InstanceList: TipoAtividade2.list(params), tipoAtividade2InstanceTotal: TipoAtividade2.count()]
    }

    def create() {
        [tipoAtividade2Instance: new TipoAtividade2(params)]
    }

    def save() {
        def tipoAtividade2Instance = new TipoAtividade2(params)
        if (!tipoAtividade2Instance.save(flush: true)) {
            render(view: "create", model: [tipoAtividade2Instance: tipoAtividade2Instance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), tipoAtividade2Instance.id])
        redirect(action: "show", id: tipoAtividade2Instance.id)
    }

    def show(Long id) {
        def tipoAtividade2Instance = TipoAtividade2.get(id)
        if (!tipoAtividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), id])
            redirect(action: "list")
            return
        }

        [tipoAtividade2Instance: tipoAtividade2Instance]
    }

    def edit(Long id) {
        def tipoAtividade2Instance = TipoAtividade2.get(id)
        if (!tipoAtividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), id])
            redirect(action: "list")
            return
        }

        [tipoAtividade2Instance: tipoAtividade2Instance]
    }

    def update(Long id, Long version) {
        def tipoAtividade2Instance = TipoAtividade2.get(id)
        if (!tipoAtividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoAtividade2Instance.version > version) {
                tipoAtividade2Instance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2')] as Object[],
                          "Another user has updated this TipoAtividade2 while you were editing")
                render(view: "edit", model: [tipoAtividade2Instance: tipoAtividade2Instance])
                return
            }
        }

        tipoAtividade2Instance.properties = params

        if (!tipoAtividade2Instance.save(flush: true)) {
            render(view: "edit", model: [tipoAtividade2Instance: tipoAtividade2Instance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), tipoAtividade2Instance.id])
        redirect(action: "show", id: tipoAtividade2Instance.id)
    }

    def delete(Long id) {
        def tipoAtividade2Instance = TipoAtividade2.get(id)
        if (!tipoAtividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoAtividade2Instance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoAtividade2.label', default: 'TipoAtividade2'), id])
            redirect(action: "show", id: id)
        }
    }
}
