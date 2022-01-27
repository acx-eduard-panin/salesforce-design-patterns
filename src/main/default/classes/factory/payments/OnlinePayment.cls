public with sharing class OnlinePayment implements IPayment {
    public void pay() {
        System.debug(ClassNameUtil.getLocation() + ' payed');
    }

    public String getType() {
        return 'Online';
    }
}