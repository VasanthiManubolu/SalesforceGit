
/* trigger to update contact when accounts phone changed. */

trigger updateRelatedContacts on Account(after update){	
	
	Map<id,String> accMap=new Map<id,String>();
	
	for(Account acc: Trigger.new){
        
		if(acc.phone != Trigger.oldmap.get(acc.id).phone){		
			
			accMap.put(acc.id,acc.phone);
		}      
	
	}
	
	List<Contact> conList=new List<Contact> ();
	
	for(Contact con: [Select id,Name,phone,accountId From Contact where accountId IN : accMap.keyset()]){
        
		if(accMap.keyset().contains(con.accountid)){
            
			contact c=new contact();
            c.id=con.id;
            c.phone=accMap.get(con.accountid);
            conList.add(c);
		
		}
	
	}
   	update conList; 
 
 }