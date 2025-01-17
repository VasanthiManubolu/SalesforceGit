# Trigger Challenge :2 -Write an Apex trigger to update a custom field on all related Opportunities when an Account’s status changes to ‘Preferred’.


trigger UpdateOpportunityOnAccountStatusChange on Account (after update) {

    set<id> idList=new set<id>();
  
   for(Account acc:Trigger.new){
   
    if(acc.status=='Preferred' and  Trigger.oldMap.get(acc.id).status  != 'Preferred'){
	
	 idList.add(acc.id);
	}
   }
   
   List<opportunity> updateoppList=new List<opportunity>();
   for(opportunity oppRec:[select id ,name,newfield__c from opportunity where accoundid IN : accList]){
   
		opportunity opp=new opprtunity();
		
		opp.id=oppRec.id;
		opp.newfield__c='new value';
		updateoppList.add(opp);
   
   }
  
  if(!oppsToUpdate.isEmpty()){
   update updateoppList;
  }

}
