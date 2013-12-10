package sisap

import org.springframework.dao.DataIntegrityViolationException

class PeriodoDisciplinaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [periodoDisciplinaInstanceList: PeriodoDisciplina.list(params), periodoDisciplinaInstanceTotal: PeriodoDisciplina.count()]
    }

    def create() {
        [periodoDisciplinaInstance: new PeriodoDisciplina(params)]
    }

    def save() {
        def periodoDisciplinaInstance = new PeriodoDisciplina(params)
        if (!periodoDisciplinaInstance.save(flush: true)) {
            render(view: "create", model: [periodoDisciplinaInstance: periodoDisciplinaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), periodoDisciplinaInstance.id])
        redirect(action: "show", id: periodoDisciplinaInstance.id)
    }

    def show(Long id) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        [periodoDisciplinaInstance: periodoDisciplinaInstance]
    }

    def edit(Long id) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        [periodoDisciplinaInstance: periodoDisciplinaInstance]
    }

    def update(Long id, Long version) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (periodoDisciplinaInstance.version > version) {
                periodoDisciplinaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina')] as Object[],
                          "Another user has updated this PeriodoDisciplina while you were editing")
                render(view: "edit", model: [periodoDisciplinaInstance: periodoDisciplinaInstance])
                return
            }
        }

        periodoDisciplinaInstance.properties = params

        if (!periodoDisciplinaInstance.save(flush: true)) {
            render(view: "edit", model: [periodoDisciplinaInstance: periodoDisciplinaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), periodoDisciplinaInstance.id])
        redirect(action: "show", id: periodoDisciplinaInstance.id)
    }

    def delete(Long id) {
        def periodoDisciplinaInstance = PeriodoDisciplina.get(id)
        if (!periodoDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
            return
        }

        try {
            periodoDisciplinaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina'), id])
            redirect(action: "show", id: id)
        }
    }
}
