public with sharing class PayPallPayment implements IPayment {
    public void pay() {
        System.debug(ClassNameUtil.getLocation() + ' paid');
    }

    public String getType() {
        return 'PayPall';
    }
}