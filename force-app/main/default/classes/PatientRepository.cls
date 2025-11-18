public with sharing class PatientRepository {

  public static Patient__c getPatientById(String Id) {
    return [SELECT Id, Name, Last_Name__c, Age__c, Gender__c, Email__c,	Phone_Number__c, Health_Insurance_Provider__c 
            FROM Patient__c 
            WHERE Id = :Id];
  }
}