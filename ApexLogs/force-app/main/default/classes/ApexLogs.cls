public with sharing class ApexLogs implements IApexLogs {
    
    public ApexLogs() {

    }

    public void logInformation(string message){
        
        createApexLogEvent('information', message);

    }

    public void logWarning(string message){

        createApexLogEvent('warning', message);

    }

    public void logError(string message){

        createApexLogEvent('error', message);

    }

    private void createApexLogEvent(string logType, string message){

        List<Apex_Log_Event__e> events = new List<Apex_Log_Event__e>();
        events.add(new Apex_Log_Event__e(Type__c = logType, Message__c = message));

        List<Database.SaveResult> results = EventBus.publish(events);

        for (Database.SaveResult sr : results) {
        if (sr.isSuccess()) {
            System.debug('Successfully published event.');
        } else {
            for(Database.Error err : sr.getErrors()) {
                System.debug('Error returned: ' +
                            err.getStatusCode() +
                            ' - ' +
                            err.getMessage());
            }
        }       
        }
    }
}
