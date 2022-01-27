public with sharing class AtmPayment implements IPayment {
    public void pay() {
        System.debug(ClassNameUtil.getLocation() + ' payed');
    }

    public String getType() {
        return 'ATM';
    }
}