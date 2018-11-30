trigger ClosedOpportunityTrigger on Opportunity (after insert, after update){
    
    List<Task> taskToInsert = new List<Task>();

    for (Opportunity o : Trigger.new){
        if (o.StageName == 'Closed Won') {
            Task task = new Task();
            task.Subject = 'Follow Up Test Task';
            task.WhatID = o.ID;
            taskToInsert.add(task);
        }
    }
    insert taskToInsert;

}