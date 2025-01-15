trigger AccountCountOnUser on Account (after insert,after update) {
    List<Id> userIds = new List<Id>();
      Map<Id,Integer> userAccounts = new Map<Id,Integer>();
      if(Trigger.isInsert){
          for(Account account:trigger.new){
              userIds.add(account.ownerId);
          }
      }
      if(Trigger.isUpdate){       
          for(Account account:trigger.new){
               
              if(account.OwnerId!=trigger.oldMap.get(account.Id).OwnerId){
                  userIds.add(account.ownerId);
                  userIds.add(oldAccount.ownerId);
              }else{
                  userIds.add(account.ownerId);
              }
          }
       }
           
      List<AggregateResult> aggr = [Select count(Id) accId,ownerId from Account 
                                                                    where ownerId in : userIds 
                                                                    group by OwnerId];
      for(AggregateResult aggrvalu : aggr){
          userAccounts.put((String)aggrvalu.get('ownerId'),(Integer)aggrvalu.get('accId'));
      }
     
      AccountCountonUser.getCount(userAccounts);
  }