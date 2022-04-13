public with sharing class ReturnMapController {

    @AuraEnabled
    
   public static map<String,List<sObject>> getMap(){
        
  Map<String,List<sObject>> myMap = new Map<String,List<sObject>>();
        
  if(
    Contact.SObjectType.getDescribe().isAccessible() &&
    Account.SObjectType.getDescribe().isAccessible() &&
    Product2.SObjectType.getDescribe().isAccessible() &&
    Lead.SObjectType.getDescribe().isAccessible()) 
    {
        List<Account> acclist= [select id, name from Account Limit 10];
        List<Contact> conlist=[select id, name from Contact Limit 10];
        List<Product2> prodlist=[select id, name from Product2 Limit 10];
        List<Lead> leadlist=[select id, name from Lead Limit 10];
        
        myMap.put('RecentAccounts',acclist);
        myMap.put('RecentContacts',conlist);
        myMap.put('RecentProducts',prodlist);
        myMap.put('RecentLeads',leadlist);
    }
         
  return myMap;
  }
}