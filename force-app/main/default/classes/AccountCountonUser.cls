public with sharing class AccountCountonUser {
    @future
   public static void getCount(Map<id,integer> userMap){   
	List<User> listuser = new List<User>();
        for(Id id:userMap.keySet()){
            user userupdate = new User(Id=id);
            userupdate.Account_Count__c=userMap.get(Id);
            
            listuser.add(userupdate);
        }
   }
}