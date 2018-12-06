({
	validateContactForm : function(component) {
        
        var validContact = true;
        
        // Visualizza errore se i campi obbligatori sono vuoti
        var allValid = component.find('contactField').reduce(function (validFields, inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validFields && inputCmp.get('v.validity').valid;
        }, true);
        
        if (allValid){
            // Verifica se ha l'account associato
            var account = component.get('v.account');
            if ($A.util.isEmpty(account)) {
                validContact = false;
                console.log("Quick action context doesn't have a valid account.");
            }
            return (validContact);
        }
	}
})