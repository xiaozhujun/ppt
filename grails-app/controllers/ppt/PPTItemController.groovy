package ppt

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PPTItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [PPTItemInstanceList: PPTItem.list(params), PPTItemInstanceTotal: PPTItem.count()]
    }

    def create() {
        [PPTItemInstance: new PPTItem(params)]
    }

    def save() {
        def PPTItemInstance = new PPTItem();
        PPTItemInstance.properties = params
        PPTItemInstance.startTime = new Date().parse("yyyy-MM-dd",params.startTime);
        PPTItemInstance.endTime = new Date().parse("yyyy-MM-dd",params.endTime);
        PPTItemInstance.createTime = new Date();
        PPTItemInstance.clearErrors();
        if (!PPTItemInstance.save(flush: true)) {
            render(view: "create", model: [PPTItemInstance: PPTItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), PPTItemInstance.id])
        redirect(action: "show", id: PPTItemInstance.id)
    }

    def show(Long id) {
        def PPTItemInstance = PPTItem.get(id)
        if (!PPTItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), id])
            redirect(action: "list")
            return
        }

        [PPTItemInstance: PPTItemInstance]
    }

    def edit(Long id) {
        def PPTItemInstance = PPTItem.get(id)
        if (!PPTItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), id])
            redirect(action: "list")
            return
        }

        [PPTItemInstance: PPTItemInstance]
    }

    def update(Long id, Long version) {
        def PPTItemInstance = PPTItem.get(id)
        if (!PPTItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (PPTItemInstance.version > version) {
                PPTItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'PPTItem.label', default: 'PPTItem')] as Object[],
                          "Another user has updated this PPTItem while you were editing")
                render(view: "edit", model: [PPTItemInstance: PPTItemInstance])
                return
            }
        }

        PPTItemInstance.properties = params
        PPTItemInstance.startTime = new Date().parse("yyyy-MM-dd",params.startTime);
        PPTItemInstance.endTime = new Date().parse("yyyy-MM-dd",params.endTime);
        PPTItemInstance.clearErrors();
        if (!PPTItemInstance.save(flush: true)) {
            render(view: "edit", model: [PPTItemInstance: PPTItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), PPTItemInstance.id])
        redirect(action: "show", id: PPTItemInstance.id)
    }

    def delete(Long id) {
        def PPTItemInstance = PPTItem.get(id)
        if (!PPTItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), id])
            redirect(action: "list")
            return
        }

        try {
            PPTItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'PPTItem.label', default: 'PPTItem'), id])
            redirect(action: "show", id: id)
        }
    }

    //预览ppt
    def pptView(){
        def c = PPTItem.createCriteria();
        def list = c{
           and{
               ge("endTime",new Date())
               le("startTime",new Date())
           }
           order("id","desc")
        };
        [PPTItemInstanceList: list]
    }
}
