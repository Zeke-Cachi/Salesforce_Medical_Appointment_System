/**
 * PatientController class
 * @description It manages client requests about the Patient__c object
 */
public with sharing class PatientController {
  
    /**
    * getPatientById
    * @description calls the service layer to retrieve a Patient__c object, if existing 
    * @param id representing the id of a patient
    * @return Patient__c
    */
  @AuraEnabled(cacheable=true)
  public static Patient__c getPatientById(String id) {
    return PatientService.getPatientById(id);
  }
}