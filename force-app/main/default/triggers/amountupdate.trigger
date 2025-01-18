#Trigger Challenge @3 : A custom roll-up summary on the parent account of the amount field on opportunity records.

trigger amountupdate on opportunity(after insert,after update){
 
	set<id> accIdList=new set<id>();
	
	for(opportunity opp:Trigger.new){
		accIdList.add(opp.accountid);
	 
	}
	
	for(AggrgateResult arg:[select accountid,sum(amount) amt from opportunity where accountid IN : accIdList group by accountid ]){
	
	 Account acc=new Account();
	 acc.id=(id) arg.get('accountid');
	 acc.AccountAmount__c= (integer) arg.get('amt');
	 
	 accupdateList.add(acc);
	}
	update accupdateList;	
 
 }
