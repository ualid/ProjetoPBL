package sisap

import org.springframework.dao.DataIntegrityViolationException

class TurmaPessoaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [turmaPessoaInstanceList: TurmaPessoa.list(params), turmaPessoaInstanceTotal: TurmaPessoa.count()]
    }

    def create() {
        [turmaPessoaInstance: new TurmaPessoa(params)]
    }

    def save() {
        def turmaPessoaInstance = new TurmaPessoa(params)
        if (!turmaPessoaInstance.save(flush: true)) {
            render(view: "create", model: [turmaPessoaInstance: turmaPessoaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), turmaPessoaInstance.id])
        redirect(action: "show", id: turmaPessoaInstance.id)
    }

    def show(Long id) {
        def turmaPessoaInstance = TurmaPessoa.get(id)
        if (!turmaPessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), id])
            redirect(action: "list")
            return
        }

        [turmaPessoaInstance: turmaPessoaInstance]
    }

    def edit(Long id) {
        def turmaPessoaInstance = TurmaPessoa.get(id)
        if (!turmaPessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), id])
            redirect(action: "list")
            return
        }

        [turmaPessoaInstance: turmaPessoaInstance]
    }

    def update(Long id, Long version) {
        def turmaPessoaInstance = TurmaPessoa.get(id)
        if (!turmaPessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (turmaPessoaInstance.version > version) {
                turmaPessoaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'turmaPessoa.label', default: 'TurmaPessoa')] as Object[],
                          "Another user has updated this TurmaPessoa while you were editing")
                render(view: "edit", model: [turmaPessoaInstance: turmaPessoaInstance])
                return
            }
        }

        turmaPessoaInstance.properties = params

        if (!turmaPessoaInstance.save(flush: true)) {
            render(view: "edit", model: [turmaPessoaInstance: turmaPessoaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), turmaPessoaInstance.id])
        redirect(action: "show", id: turmaPessoaInstance.id)
    }

    def delete(Long id) {
        def turmaPessoaInstance = TurmaPessoa.get(id)
        if (!turmaPessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), id])
            redirect(action: "list")
            return
        }

        try {
            turmaPessoaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'turmaPessoa.label', default: 'TurmaPessoa'), id])
            redirect(action: "show", id: id)
        }
    }
}
