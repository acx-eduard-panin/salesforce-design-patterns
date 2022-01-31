@IsTest
public class OpportunityTestBuilder implements IOpportunityTestBuilder {
    private static final String site = 'https://www.google.com/';
    User userRecord;
    Opportunity opportunityRecord;
    Account accountRecord;

    public IOpportunityTestBuilder createManager() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        userRecord = new User(
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
        insert userRecord;

        return this;
    }

    public IOpportunityTestBuilder createAccount() {
        accountRecord = new Account(
                Name = 'Test 1',
                Site = site
        );

        insert accountRecord;
        return this;
    }

    public IOpportunityTestBuilder createOpportunity() {
        opportunityRecord = new Opportunity(
                Name = 'Test Opportunity Test',
                CloseDate = Date.today().addDays(7),
                StageName = 'Prospecting',
                OwnerId = userRecord?.Id,
                AccountId = accountRecord?.Id
        ) ;
        insert opportunityRecord;

        return this;
    }

    public Opportunity build() {
        return opportunityRecord;
    }
}