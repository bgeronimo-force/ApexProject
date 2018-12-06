({
	doInit : function(component, event, helper) {
		
        // Prelevare l'account relativo
        // definisco l'azione (chiamo metodo apex)
        var action = component.get("c.getAccount");
        // setto i parametri ricavandolo dal component
        action.setParams({
            "accountId": component.get("v.recordId")
        });
        
        // configuro l'handler e verifico il risultato
        action.setCallback(this, function(response) {
        	var state = response.getState();
        	if (state === "SUCCESS") {
                component.set("v.account", response.getReturnValue());
            } else {
                console.log('Problem getting account, response state error: ' + state);
            }
        });
        $A.enqueueAction(action);
	},
    
    handleSaveContact : function(component, event, helper) {
        // Verifico la validità dei dati inseriti con l'helper
        if(helper.validateContactForm(component)) {
            
            // inizializzo il contact con account da salvare
            var saveContactAction = component.get("c.saveContactWithAccount");
            saveContactAction.setParams({
                "contact": component.get("v.newContact"),
                "accountId": component.get("v.recordId")
            });
            
            // inserisco il contact e verifico il risultato
            saveContactAction.setCallback(this, function(response) {
                var state = response.getState();
                if (state==="SUCCESS") {

                    // Messaggio per OK
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Contact Saved",
                        "message": "The new contact was created."
                    });
                    
                    // Aggiorna UI
                    $A.get("e.force:closeQuickAction").fire(); //chiude il form
                    resultsToast.fire(); //mostra messaggio
                    $A.get("e.force:refreshView").fire(); //aggiorna pagina account
                    
                }
                else if (state === "ERROR") {
                    // errore salva contatto
                    console.log('Problem saving contact, response state: ' + state);
                }
                else {
                    console.log('Unknown problem, response state: ' + state);     
                }
            });
            // Crea il contatto
            $A.enqueueAction(saveContactAction);
        }
    },
    
    handleCancel : function(component, event, helper) {
        // chiudi il form
        $A.get("e.force:closeQuickAction").fire();
    }
})