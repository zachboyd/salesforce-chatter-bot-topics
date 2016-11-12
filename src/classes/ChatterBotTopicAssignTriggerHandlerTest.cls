@isTest
private class ChatterBotTopicAssignTriggerHandlerTest {

    // How to Create FeedItems in Apex
    // https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_objects_feeditem.htm

    @isTest
    static void test_active_chatter_bot_topic() {

        // all existing topics are available in unit tests despite not having SeeAllData=true
        // so need to create a unique name to avoid collissions
        String uniqueTopicName = 'Help' + DateTime.now().getTime();

        Chatter_Bot_Topic__c cbt = new Chatter_Bot_Topic__c(
            topic_name__c = uniqueTopicName,
            active__c = true
        );

        insert cbt;

        Account acct = new Account(
            name = 'Salesforce'
        );

        insert acct;

        FeedItem item = new FeedItem(
            parentId = acct.id,
            body = 'Hello World'
        );

        insert item;

        Topic topic = new Topic(
            name = uniqueTopicName
        );

        insert topic;

        Test.startTest();

        TopicAssignment ta = new TopicAssignment(
            entityId = item.id,
            topicId = topic.id
        );

        insert ta;

        Test.stopTest();

        List<Chatter_Bot_Topic_Assignment__c> assignments = [ SELECT id, chatter_bot__c, topic__c, feed_item_id__c, feed_item_parent_id__c, feed_item_body__c FROM Chatter_Bot_Topic_Assignment__c ];

        System.assertEquals( 1, assignments.size() );
        System.assertEquals( cbt.id, assignments[0].chatter_bot__c );
        System.assertEquals( topic.name, assignments[0].topic__c );
        System.assertEquals( item.id, assignments[0].feed_item_id__c );
        System.assertEquals( acct.id, assignments[0].feed_item_parent_id__c );
        System.assertEquals( item.body, assignments[0].feed_item_body__c );

    }

    @isTest
    static void test_inactive_chatter_bot_topic() {

        // all existing topics are available in unit tests despite not having SeeAllData=true
        // so need to create a unique name to avoid collissions
        String uniqueTopicName = 'Help' + DateTime.now().getTime();

        Chatter_Bot_Topic__c cbt = new Chatter_Bot_Topic__c(
            topic_name__c = uniqueTopicName,
            active__c = false
        );

        insert cbt;

        Account acct = new Account(
            name = 'Salesforce'
        );

        insert acct;

        FeedItem item = new FeedItem(
            parentId = acct.id,
            body = 'Hello World'
        );

        insert item;

        Topic topic = new Topic(
            name = uniqueTopicName
        );

        insert topic;

        Test.startTest();

        TopicAssignment ta = new TopicAssignment(
            entityId = item.id,
            topicId = topic.id
        );

        insert ta;

        Test.stopTest();

        List<Chatter_Bot_Topic_Assignment__c> assignments = [ SELECT id, chatter_bot__c, topic__c, feed_item_id__c, feed_item_parent_id__c, feed_item_body__c FROM Chatter_Bot_Topic_Assignment__c ];

        System.assertEquals( 0, assignments.size() );

    }

}