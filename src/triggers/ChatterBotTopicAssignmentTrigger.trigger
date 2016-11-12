trigger ChatterBotTopicAssignmentTrigger on TopicAssignment ( after insert ) {

    new ChatterBotTopicAssignTriggerHandler().handleAssignments( Trigger.new );

}