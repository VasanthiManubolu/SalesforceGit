/* Create an apex method that takes an account ID and creates associated contacts*/
public class creatContactHandler {
  
    public static void createContact(List<Account> triggerNew){  
    
      List<contact> newContacts=new List<Contact>(); 
 
     for(Account acc:TriggerNew){	
       Contact con=new Contact();
       con.accountid=acc.id;
       con.LastName=acc.Name;
       newContacts.add(acc);
       
       }
       
       if(!newContacts.isBlank()){
         insert newContacts;
       }
    
    }
   
   }