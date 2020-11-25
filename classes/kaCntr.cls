public class kaCntr {

    @AuraEnabled 
    public static List<Knowledge__kav> getKARecords(String recordId)
    {
        List<Knowledge__kav> ka = [SELECT Id, Title,Summary
                                   FROM Knowledge__kav
                                   WHERE Id=:recordId]; 
        return ka;
    }
}