public with sharing class Director {
    public SObject constructOpportunityWithUser(IOpportunityTestBuilder builder) {
        return builder
                .createManager()
                .createAccount()
                .createOpportunity()
                .build();
    }
}