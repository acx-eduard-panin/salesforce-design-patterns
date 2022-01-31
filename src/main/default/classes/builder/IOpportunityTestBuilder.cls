public interface IOpportunityTestBuilder {
    IOpportunityTestBuilder createManager();
    IOpportunityTestBuilder createAccount();
    IOpportunityTestBuilder createOpportunity();
    Opportunity build();
}