@IsTest
private class PatientControllerTests {

  @TestSetup
  static void makeData(){
    Health_Insurance_Provider__c testHip = new Health_Insurance_Provider__c(Name= 'Galeno');
    insert testHip;

    Patient__c individualPatient = new Patient__c(
      age__c=18, 
      Date_of_Birth__c= Date.newInstance(1960, 2, 17), 
      email__c= 'patient1@gmail.com', 
      Gender__c= 'Male',
      Health_Insurance_Provider__c = testHip.Id,
      Name= 'John',
      Last_Name__c= 'Smith',
      Phone_Number__c = '341-234-4987'
    );
    insert individualPatient;
  }

  @IsTest
  private static void successfulGetPatientById() {
    //Given
    Patient__c testPatient = [SELECT Id, age__c, Date_of_Birth__c, email__c, Gender__c, Health_Insurance_Provider__c, Name, Last_Name__c, Phone_Number__c
                              FROM Patient__c
                              LIMIT 1];

    //When
    Test.startTest();
      Patient__c resultingPatient = PatientController.getPatientById(testPatient.Id);
    Test.stopTest();

    //Then
    System.assertEquals(testPatient.Id, resultingPatient.Id);
    Assert.isNotNull(resultingPatient);
  }
}