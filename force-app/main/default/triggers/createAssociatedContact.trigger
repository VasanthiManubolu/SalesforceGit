/* Create an apex method that takes an account ID and creates associated contacts*/
  
trigger createAssociatedContact on Account(after insert){
  
	creatContactHandler.createContact(Trigger.New);
  
  }