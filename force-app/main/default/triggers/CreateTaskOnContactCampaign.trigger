rigger CreateTaskOnContactCampaign on CampaignMember (after insert) {

    List<Task> tasksToCreate = new List<Task>();

    for (CampaignMember cm : Trigger.new) {

        if (cm.ContactId != null) {

            Task newTask = new Task(

                WhatId = cm.ContactId,

                Subject = ‘Follow-up’,

                ActivityDate = System.today().addDays(7)

            );

            tasksToCreate.add(newTask);

        }

    }

    if (!tasksToCreate.isEmpty()) {

        insert tasksToCreate;

    }

}
