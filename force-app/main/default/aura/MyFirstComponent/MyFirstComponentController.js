({
	myAction : function(component, event, helper) {	
	},
    
    doInit:function(component, event, helper) {
        // Account
    	var action = component.get("c.getAccount"); //va a cercarmi il metodo della classe apex
        action.setParams({
            accountId: component.get("v.recordId") //settare i parametri da passare al metodo della classe apex
        });
        
        action.setCallback(this, function(data){
            component.set("v.account", data.getReturnValue());
        }); //assegno il risultato del metodo apex su attributo del component
        
        $A.enqueueAction(action); //metto l'azione in una coda
    	
        // Owner/User
    	var action_user = component.get("c.getOwner"); //va a cercarmi il metodo della classe apex
        action_user.setParams({
            accountId: component.get("v.recordId") //settare i parametri da passare al metodo della classe apex
        });
        
        action_user.setCallback(this, function(data){
            component.set("v.user", data.getReturnValue());
        }); //assegno il risultato del metodo apex su attributo del component
        
        $A.enqueueAction(action_user); //metto l'azione in una coda
        
        // Contacts
        component.set("v.col", [
            {label:"First Name", fieldName:"FirstName", type:"text"},
            {label:"Last Name", fieldName:"LastName", type:"text"},
            {label:"Phone", fieldName:"Phone", type:"phone"},
        ]);
    	var action_cnts = component.get("c.getContacts"); //va a cercarmi il metodo della classe apex
        action_cnts.setParams({
            accountId: component.get("v.recordId") //settare i parametri da passare al metodo della classe apex
        });
        
        action_cnts.setCallback(this, function(data){
            component.set("v.cnt", data.getReturnValue());
        }); //assegno il risultato del metodo apex su attributo del component
        
        $A.enqueueAction(action_cnts); //metto l'azione in una coda
	}
})