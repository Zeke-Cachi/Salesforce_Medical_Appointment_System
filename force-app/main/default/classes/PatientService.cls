public with sharing class PatientService {

  public static Patient__c getPatientById(String Id) {
    return PatientRepository.getPatientById(Id);
  }
}