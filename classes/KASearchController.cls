public with sharing class KASearchController {


   @AuraEnabled
    public static List<KA_Data_Category__mdt> getPicklistValues(){
        List<KA_Data_Category__mdt> k1 = [SELECT Id,MasterLabel FROM  KA_Data_Category__mdt];
        return k1;
    }
    
    @AuraEnabled
    public static List<Knowledge__kav> searchKnowledgeArticles( String searchTerm ) {
        List<Knowledge__kav> ka = new List<Knowledge__kav>();
        if ( String.isNotBlank( searchTerm ) ) {
            List<List<SObject>> searchResults = [
                FIND :searchTerm
                RETURNING Knowledge__kav(
                    Id, Title, Summary 
                    ORDER BY Title
                    LIMIT 10
                )
            ];
            ka = searchResults[0];
        }
        return ka;
    }
    @AuraEnabled
    public static List<SObject> getArticlesList(string searchString, string dataCategory){
        system.debug('Inside the Apex method');
       
         string dcquery=  'SELECT Id, DataCategoryGroupName, DataCategoryName FROM Knowledge__DataCategorySelection';
         
       List<Knowledge__DataCategorySelection> dcs =  Database.query(dcquery);
        string catGroup = null;
        string catName = dataCategory+'__c';
         for (Knowledge__DataCategorySelection r : dcs) {
            
             if(r.DataCategoryName == dataCategory){
                 catGroup = r.DataCategoryGroupName + '__c' ;
                 break;
             }
        }
        //string catName = dcs[0].DataCategoryGroupName +'__c';
        string Online = 'Online';
        string title ='%'+ searchString + '%';
        string language = 'en_US';
        string query = 'SELECT Title, Summary,ArticleNumber,Id, LastPublishedDate,ArticleTotalViewCount,UrlName  ';
                  query=query+                'FROM KnowledgeArticleVersion ';
                          query=query+         'WHERE PublishStatus=:Online and (Title like :title or Summary like :title) ';
                          query=query+         'AND Language = :language ';
                           query=query+        'WITH DATA CATEGORY '+ catGroup +' at ('+ catName+')';
        
        List<SObject> articles = Database.query(query);
        
       
        
       /* List<SObject> articles = [SELECT Title, Summary,ArticleNumber,Id, LastPublishedDate 
                                  FROM KnowledgeArticleVersion
                                  WHERE PublishStatus='Online' and (Title like '%contribution%' or Summary like '%contribution%')
                                  AND Language = 'en_US'
                                  WITH DATA CATEGORY Audience__c at (Employee__c)];
          query=query+         'AND Language = :language ';
                           query=query+        'WITH DATA CATEGORY '+ catGroup +' at ('+ catName+')';

       */
        
        system.debug('Articles :'+articles);
        return articles;
    }
     @AuraEnabled
    public static List<SObject> getSearchArticlesList(string searchString){
        system.debug('Inside the Apex method');
       
  
        //string catName = dcs[0].DataCategoryGroupName +'__c';
        string Online = 'Online';
        string title ='%'+ searchString + '%';
        string language = 'en_US';
        string query = 'SELECT Title, Summary,ArticleNumber,Id, LastPublishedDate,ArticleTotalViewCount,UrlName  ';
                  query=query+                'FROM KnowledgeArticleVersion ';
                          query=query+         'WHERE PublishStatus=:Online and (Title like :title or Summary like :title) ';
                          query=query+         'AND Language = :language ';
        List<SObject> articles = Database.query(query);
        
       
        
       /* List<SObject> articles = [SELECT Title, Summary,ArticleNumber,Id, LastPublishedDate 
                                  FROM KnowledgeArticleVersion
                                  WHERE PublishStatus='Online' and (Title like '%contribution%' or Summary like '%contribution%')
                                  AND Language = 'en_US'
                                  WITH DATA CATEGORY Audience__c at (Employee__c)];
          query=query+         'AND Language = :language ';
                           query=query+        'WITH DATA CATEGORY '+ catGroup +' at ('+ catName+')';

       */
        
        system.debug('Articles :'+articles);
        return articles;
    }
    
    @AuraEnabled 
    public static List<Knowledge__kav> getKADetails(String kaId){
        List<Knowledge__kav> k1 = [SELECT Id, Title,Summary,KCSArticle_Issue__c
                                   FROM Knowledge__kav
                                  WHERE Id =:kaId];
        return k1;
    }
}