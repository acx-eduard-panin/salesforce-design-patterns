public with sharing class CashPayment implements IPayment {
    public void pay() {
        System.debug(ClassNameUtil.getLocation() + ' paid');
    }

    public String getType() {
        return 'Cash';
    }
}