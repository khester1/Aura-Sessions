public with sharing class contactSearchController {
   @AuraEnabled
   public static list<Contact> getContactList (String searchTerm) {

       try {
       String modifiedSearchTerm = '%' +searchTerm+'%';
       List<Contact> matchedContactList = [select name, email from contact where name like: modifiedSearchTerm];
       return matchedContactList;
           
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
   }

}
