public with sharing class PaymentFactory {
    /**
     * Reflection in Apex
     */
    public static IPayment getInstance(String supportType) {
        Map<String, String> mapping = getPaymentMapping();
        if (!mapping.containsKey(supportType)) {
            throw new PaymentException('this method does not have realisation of payment process');
        }

        Type paymentType = Type.forName(mapping.get(supportType));

        return (IPayment)paymentType.newInstance();
    }

    private static Map<String, String> getPaymentMapping() {
        Map<String, String> result = new Map<String, String>();
        for (PaymentTypeInfo__mdt paymentTypeInfo : PaymentTypeInfo__mdt.getAll().values()) {
            result.put(paymentTypeInfo.PaymentType__c, paymentTypeInfo.ClassName__c);
        }

        return result;
    }

    public static IPayment getInstanceWrong(String supportType) {
        IPayment support = null;

        switch on supportType {
            when 'ATM' {
                support = new AtmPayment();
            }
            when 'PayPall' {
                support = new PayPallPayment();
            }
            when 'Online' {
                support = new OnlinePayment();
            }
            when else {
                support = new CashPayment();
            }
        }

        return support;
    }

}