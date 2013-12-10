package sisap

import org.springframework.dao.DataIntegrityViolationException

class Atividade2Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [atividade2InstanceList: Atividade2.list(params), atividade2InstanceTotal: Atividade2.count()]
    }

    def create() {
        [atividade2Instance: new Atividade2(params)]
    }

    def save() {
        def atividade2Instance = new Atividade2(params)
        if (!atividade2Instance.save(flush: true)) {
            render(view: "create", model: [atividade2Instance: atividade2Instance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), atividade2Instance.id])
        redirect(action: "show", id: atividade2Instance.id)
    }

    def show(Long id) {
        def atividade2Instance = Atividade2.get(id)
        if (!atividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), id])
            redirect(action: "list")
            return
        }

        [atividade2Instance: atividade2Instance]
    }

    def edit(Long id) {
        def atividade2Instance = Atividade2.get(id)
        if (!atividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), id])
            redirect(action: "list")
            return
        }

        [atividade2Instance: atividade2Instance]
    }

    def update(Long id, Long version) {
        def atividade2Instance = Atividade2.get(id)
        if (!atividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (atividade2Instance.version > version) {
                atividade2Instance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'atividade2.label', default: 'Atividade2')] as Object[],
                          "Another user has updated this Atividade2 while you were editing")
                render(view: "edit", model: [atividade2Instance: atividade2Instance])
                return
            }
        }

        atividade2Instance.properties = params

        if (!atividade2Instance.save(flush: true)) {
            render(view: "edit", model: [atividade2Instance: atividade2Instance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), atividade2Instance.id])
        redirect(action: "show", id: atividade2Instance.id)
    }

    def delete(Long id) {
        def atividade2Instance = Atividade2.get(id)
        if (!atividade2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), id])
            redirect(action: "list")
            return
        }

        try {
            atividade2Instance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'atividade2.label', default: 'Atividade2'), id])
            redirect(action: "show", id: id)
        }
    }
}
