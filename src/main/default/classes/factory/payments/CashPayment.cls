public with sharing class CashPayment implements IPayment {
    public void pay() {
        System.debug(ClassNameUtil.getLocation() + ' payed');
    }

    public String getType() {
        return 'Cash';
    }
}