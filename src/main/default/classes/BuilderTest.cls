@IsTest
public class BuilderTest {
    @IsTest
    static void validateSiteBuilder() {
        Director director = new Director();
        Opportunity opportunityRecord = (Opportunity) director.constructOpportunityWithUser(new OpportunityTestBuilder());
        Opportunity oppInserted = [
                SELECT Account.Site
                FROM Opportunity
                WHERE Id = :opportunityRecord.Id
        ];

        System.assertEquals('https://www.google.com/', oppInserted.Account.Site);
    }

    @IsTest
    static void validateState() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User u = new User(
                Alias = 'standt',
                Email = 'dummyEmail@email.com',
                EmailEncodingKey = 'UTF-8',
                LastName = 'Testing',
                LanguageLocaleKey = 'en_US',
                LocaleSidKey = 'en_US',
                ProfileId = p.Id,
                TimeZoneSidKey = 'America/Los_Angeles',
                Username = 'dummyEmail' + Crypto.getRandomInteger() + '@email.com'
        );
        insert u;

        String site = 'https://www.google.com/';

        Account account = new Account(
                Name = 'Test 1',
                Site = site
        );

        insert account;

        Opportunity opp = new Opportunity(
                Name = 'Test Opportunity Test',
                CloseDate = Date.today().addDays(7),
                StageName = 'Prospecting',
                AccountId = account.Id
        ) ;
        insert opp;

        Opportunity oppInserted = [
                SELECT Account.Site
                FROM Opportunity
                WHERE Id = :opp.Id
        ];

        System.assertEquals(site, oppInserted.Account.Site) ;
    }
}