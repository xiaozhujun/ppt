package ppt

import org.springframework.dao.DataIntegrityViolationException

class PPTController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [PPTInstanceList: PPT.list(params), PPTInstanceTotal: PPT.count()]
    }

    def create() {
        [PPTInstance: new PPT(params)]
    }

    def save() {
        def PPTInstance = new PPT(params)
        if (!PPTInstance.save(flush: true)) {
            render(view: "create", model: [PPTInstance: PPTInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'PPT.label', default: 'PPT'), PPTInstance.id])
        redirect(action: "show", id: PPTInstance.id)
    }

    def show(Long id) {
        def PPTInstance = PPT.get(id)
        if (!PPTInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPT.label', default: 'PPT'), id])
            redirect(action: "list")
            return
        }

        [PPTInstance: PPTInstance]
    }

    def edit(Long id) {
        def PPTInstance = PPT.get(id)
        if (!PPTInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPT.label', default: 'PPT'), id])
            redirect(action: "list")
            return
        }

        [PPTInstance: PPTInstance]
    }

    def update(Long id, Long version) {
        def PPTInstance = PPT.get(id)
        if (!PPTInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPT.label', default: 'PPT'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (PPTInstance.version > version) {
                PPTInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'PPT.label', default: 'PPT')] as Object[],
                        "Another user has updated this PPT while you were editing")
                render(view: "edit", model: [PPTInstance: PPTInstance])
                return
            }
        }

        PPTInstance.properties = params

        if (!PPTInstance.save(flush: true)) {
            render(view: "edit", model: [PPTInstance: PPTInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'PPT.label', default: 'PPT'), PPTInstance.id])
        redirect(action: "show", id: PPTInstance.id)
    }

    def delete(Long id) {
        def PPTInstance = PPT.get(id)
        if (!PPTInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPT.label', default: 'PPT'), id])
            redirect(action: "list")
            return
        }

        try {
            PPTInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'PPT.label', default: 'PPT'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'PPT.label', default: 'PPT'), id])
            redirect(action: "show", id: id)
        }
    }
}
